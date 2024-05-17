const express = require('express');
const cors = require('cors');
const route = require('./router')

const corsOptions = {
  origin: '*', 
  methods: ['GET', 'POST', 'PUT', 'DELETE'], 
  allowedHeaders: ['Content-Type', 'Authorization'] 
};

const app = express();
app.use(express.json());
app.use(cors(corsOptions));

app.use('/protocol', route)

const PORT = 5000;

const start = async () => {
  try {
    app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
  }catch(error) {

    console.error('Ошибка запуска сервера', error)
  }
}

start();