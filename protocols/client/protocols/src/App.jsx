import '@mantine/core/styles.css';
import '@mantine/tiptap/styles.css';
import { Paper, Title } from '@mantine/core';
import { createTheme, MantineProvider } from '@mantine/core';

import styles from './styles/styles.module.css';
import style from './styles/slidesCreator.module.css'

import React, {useState, useEffect} from 'react';
import axios from 'axios';

import HeaderCom from './components/header/HeaderComponent';
import TextInput from './components/main/TextInput';
import SlidesInput from './components/main/SlidesCreator';
import TitleInput from './components/main/TitleInput';

const theme = createTheme({
  
});

function App() {
  const [titleValue, setTitleValue] = useState('');
  const [textValue, setTextValue] = useState('');
  const [htmlValue, setHTMLValue] = useState('');
  const [slides, setSlides] = useState([]);

  const handleTitleChange = (value) => {
    setTitleValue(value);
  };
  const handleTextChange = (value) => {
    setTextValue(value);
  };

  const handleHTMLChange = (value) => {
    setHTMLValue(value);
  };

  const handleSlidesChange = (value) => {
    setSlides(value);
  };

  const handleSubmit = async () => {
    try {
      const dataToSend = [
        htmlValue,
        ...slides.map((slide) => slide.html),
      ];
      const response = await axios.post('http://localhost:5000/protocol', { title: titleValue, dataToSend });
      const data = response.data;
      setTimeout(() => {
        window.location.reload();
      }, 1000);
    } catch (error) {
      console.error(error);
    }
  };
  return (
    <div className={styles.body_container}> 
      <MantineProvider theme={theme}>
        <div className={styles.header_container}>
          <HeaderCom />
        </div>
        <div className={styles.main_container}>
          <div>
            <Title order={1} className={styles.title}>
              Заполните название протокола совещания
            </Title>
            <TitleInput onTitleChange={handleTitleChange}/>
          </div>
          <div>
          <Title order={2} className={styles.title}>
              <p>Основной слайд</p>
            </Title>
            </div>          
          <div>
            <Paper
              shadow="lg"
              radius="xl"
              withBorder
              p="xl"
              className={styles.paper}
            >
              <span>Заполните протокол совещания</span>
              <TextInput onTextChange={handleTextChange} onHTMLChange={handleHTMLChange}/>
            </Paper>
          </div>

          <SlidesInput  onSlidesChange={handleSlidesChange} />
        
          <button
            onClick={handleSubmit}
            disabled={!titleValue || !textValue}
            className={style.slidesCreatorButton}
          >
            Отправить
          </button>
        </div>
      </MantineProvider>
    </div>
  );
}

export default App;
