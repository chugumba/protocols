import '@mantine/core/styles.css';
import '@mantine/tiptap/styles.css';
/* App.js */
import React from 'react';
import { Paper, Title } from '@mantine/core';
import TextInput from './components/TextInput';
import SlidesInput from './components/SlidesCreator';
import { createTheme, MantineProvider } from '@mantine/core';
import styles from './styles/styles.module.css';

const theme = createTheme({
  
});

function App() {
  return (
    <MantineProvider theme={theme}>
      <div>
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
  );
}

export default App;
