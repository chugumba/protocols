import React, { useState } from 'react';
import TextInput from './TextInput';
import styles from '../../styles/slidesCreator.module.css'

const SlidesForm = ({ onSlidesChange }) => {
  const [slides, setSlides] = useState([]);

  const handleAddSlide = () => {
    const newSlide = {};
    setSlides([...slides, newSlide]);
    onSlidesChange([...slides, newSlide]);
  };

  const handleDeleteSlide = () => {
    const deletedSlide = slides[slides.length - 1];
    setSlides(slides.slice(0, -1));
    onSlidesChange(slides.slice(0, -1));
  };

  const handleChange = (index, value) => {
    setSlides(slides.map((slide, i) => {
      if (i === index) {
        return { ...slide, html: value };
      }
      return slide;
    }));
    onSlidesChange(slides.map((slide, i) => {
      if (i === index) {
        return { ...slide, html: value };
      }
      return slide;
    }));
  };
  return (
    <div className={styles.main}>
      {slides.map((slide, index) => (
        <div key={index}>
          <TextInput
            onTextChange={(value) => handleChange(index, value)}
            onHTMLChange={(value) => handleChange(index, value)}
          />
        </div>
      ))}
      
      <button onClick={handleAddSlide} className={styles.slidesCreatorButton}>Добавить слайд</button>
      <button onClick={handleDeleteSlide} className={styles.slidesCreatorButtonDelete}>Удалить слайд</button>
    </div>
  );
};

export default SlidesForm;
