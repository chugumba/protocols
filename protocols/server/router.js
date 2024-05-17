const Router = require ('express');
const router = new Router()
const mysql = require('mysql2');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'user',
    password: '12345',
    database: 'protocols'
  });
  router.post('/', async (req, res) => {
    const titleValue = req.body.title;
    const dataToSend = req.body.dataToSend;
    let insertedId = '';
  
    const query = `INSERT INTO protocol (title) VALUES (?)`;
    db.query(query, [titleValue], (err, results) => {
      if (err) {
        console.error(err);
        res.status(500).send({ message: 'Error adding protocol' });
      } else {
        insertedId = results.insertId;
        console.log(`Data saved to database: ${titleValue} with id ${insertedId}`);
  
        let counter = 0;
        dataToSend.forEach((slide, index) => {
            const slideQuery = 'INSERT INTO slides (presentation_id, `order`, content) VALUES (?, ?, ?)';
            db.query(slideQuery, [insertedId, index, slide], (err, results) => {
            if (err) {
              console.error(err);
            } else {
              console.log(`Slide saved to database: ${slide} with order ${index}`);
              counter++;
              if (counter === dataToSend.length) {
                res.send({ message: 'Protocol and slides saved successfully' });
              }
            }
          });
        });
      }
    });
  });
  

module.exports = router;