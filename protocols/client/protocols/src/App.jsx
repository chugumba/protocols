import '@mantine/core/styles.css';
import '@mantine/tiptap/styles.css';
/* App.js */
import React, {useState} from 'react';
import { Paper, Title, Button } from '@mantine/core';
import { createTheme, MantineProvider } from '@mantine/core';

import styles from './styles/styles.module.css';

import HeaderCom from './components/header/HeaderComponent';

import TextInput from './components/main/TextInput';
import SlidesInput from './components/main/SlidesCreator';
import TitleInput from './components/main/TitleInput';

const theme = createTheme({
  
});

function App() {
  const [titleValue, setTitleValue] = useState('');
  const [textValue, setTextValue] = useState('');
  
  const handleTitleChange = (value) => {
    setTitleValue(value);
  };
  const handleTextChange = (value) => {
    setTextValue(value);
    console.log(value)
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
              <p>Заполните протокол совещания</p>
              <TextInput onTextChange={handleTextChange}/>
            </Paper>
          </div>

          {/*<div>
          <Title order={2} className={styles.title}>
              Дополнительные слайды 
            </Title>
          </div>*/}

          <SlidesInput/>
        </div>

        <Button color="teal" radius="xs" size="lg" disabled={!titleValue || !textValue} uppercase>
          Отправить слайды
        </Button >

      </MantineProvider>
    </div>
  );
}

export default App;
