import React, { useState } from 'react';
import TextInput from './TextInput';
import styles from '../../styles/slidesCreator.module.css'

const SlidesForm = () => {
  const [titleValue, setTitleValue] = useState('');
  const [textValue, setTextValue] = useState('');
  
  const handleTitleChange = (value) => {
    setTitleValue(value);
  };

  const [slides, setSlides] = useState([]);
  const [newSlideText, setNewSlideText] = useState('');

  const handleAddSlide = () => {
    setSlides([...slides, { text: newSlideText }]);
    setNewSlideText('');
  };
  {/*const handleAddSlide = () => {
    const newSlide = { text: newSlideText, id: uuidv4() };
    setSlides([...slides, newSlide]);
    setNewSlideText('');
  };*/}

  const handleTextChange = (index, text) => {
    setSlides(slides.map((slide, i) => {
      if (i === index) {
        return { ...slide, text };
      }
      return slide;
    }));
  };

  const handleDeleteSlide = (index) => {
    return () => {
      setSlides(slides.filter((slide, i) => i !== index));
    };
  };

  return (
    <div className={styles.main}>
      {/*slides.map((slide)*/slides.map((slide, index) => (
        <div /*key={slide.id}*/key={index}>
          <TextInput
            type="text"
            value={slide.text}
            onChange={(e) => handleTextChange(index, e.target.value)}
          />
           <button onClick={handleDeleteSlide(index)} className={styles.slidesCreatorButtonDelete}>Удалить слайд</button>
        </div>
      ))}
      
      <button onClick={handleAddSlide} className={styles.slidesCreatorButton}>Добавить слайд</button>
      <button onClick={handleTitleChange} disabled={!titleValue || !textValue} className={styles.slidesCreatorButton}>Отправить</button>
    </div>
  );
};

export default SlidesForm
