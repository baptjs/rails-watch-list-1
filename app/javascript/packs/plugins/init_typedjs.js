import Typed from 'typed.js';

const initTyped = () => {
  const element = document.querySelector('.typed-js');
  if (element) {
    new Typed('.typed-js', {
      strings: ['Drama', 'Classic', 'Comedy', 'Action', 'Romantic', 'Thriller', 'Horror', 'Slasher'],
      typeSpeed: 40,
      loop: true,
      loopCount: Infinity,
      showCursor: false
    });
  }
};

export { initTyped };
