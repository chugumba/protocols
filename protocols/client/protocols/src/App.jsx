import '@mantine/core/styles.css';
import '@mantine/tiptap/styles.css';
/* App.js */
import React from 'react';
import { Paper, Title } from '@mantine/core';
import { createTheme, MantineProvider } from '@mantine/core';

import styles from './styles/styles.module.css';

import HeaderCom from './components/header/HeaderComponent';

import TextInput from './components/main/TextInput';
import SlidesInput from './components/main/SlidesCreator';

const theme = createTheme({
  
});

function App() {
  return (
    <div className={styles.body_container}> 
      <MantineProvider theme={theme}>
        <div className={styles.header_container}>
          <HeaderCom />
        </div>
        <div className={styles.main_container}>
          <div>
            <Title order={1} className={styles.title}>
              Заполните протокол совещания
            </Title>
          </div>
          <div>
          <Title order={2} className={styles.title}>
              Основной слайд
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
              <TextInput/>
            </Paper>
          </div>

          <div>
          <Title order={2} className={styles.title}>
              Дополнительные слайды 
            </Title>
          </div>

          <SlidesInput/>
        </div>
      </MantineProvider>
    </div>
  );
}

export default App;
