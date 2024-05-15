import React from 'react';
import { Input } from '@mantine/core';
import styles from '../../styles/styles.module.css';

export default function TitleInput({ onTitleChange }) {
  return (
    <Input
      size="lg"
      mx="auto"
      placeholder="Номер/название протокола"
      onChange={(event) => onTitleChange(event.target.value)}
      className={styles.titleInput}
    />
  );
}
