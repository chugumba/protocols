import '@mantine/core/styles.css';
import '@mantine/tiptap/styles.css';
/* App.js */
import React, {useState} from 'react';
import { Paper, Title, Button } from '@mantine/core';
import { createTheme, MantineProvider } from '@mantine/core';

import styles from './styles/styles.module.css';
import style from './styles/slidesCreator.module.css'

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

          {/*<div>
          <Title order={2} className={styles.title}>
              Дополнительные слайды 
            </Title>
          </div>*/}

          <SlidesInput  onSlidesChange={handleSlidesChange} />
        

          {/*<Button color="teal" radius="xs" size="lg" disabled={!titleValue || !textValue} uppercase className={style.slidesCreatorButton}>
            Отправить слайды
        </Button>*/}  
        </div>
        <button
  onClick={() => {
    console.log(`Title: ${titleValue}`);
    console.log(`HTML: ${htmlValue}`);
    {slides.map((slide) => (
      
      console.log(`${slide.html}`)
   ))}
  }}
  disabled={!titleValue||!textValue}
  className={style.slidesCreatorButton}
>
  Отправить
</button>
      </MantineProvider>
    </div>
  );
}

export default App;
