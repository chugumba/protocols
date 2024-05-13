import '@mantine/core/styles.css';
import '@mantine/tiptap/styles.css';
/* App.js */
import React from 'react';
import { Paper, Title } from '@mantine/core';
import TextInput from './components/TextInput';
import TitleInput from './components/TitleInput';
import { createTheme, MantineProvider } from '@mantine/core';
import styles from './styles/styles.module.css';

const theme = createTheme({
  /** Put your mantine theme override here */
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

          <TitleInput/> 

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
      </div>
    </MantineProvider>
  );
}

export default App;
