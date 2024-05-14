import React from 'react';
import { Input } from '@mantine/core';
import styles from '../styles/styles.module.css';

export default function TitleInput() {
  return <Input size="lg" mx="auto" placeholder="Напишите заголовок слайда" className={styles.titleInput}></Input>;
}