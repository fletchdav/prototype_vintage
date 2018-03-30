let color_choices = document.querySelectorAll('.color-choice');

function colorchoice () {
  color_choices.forEach((color_choice) => {
    color_choice.addEventListener('click', () => {
      console.log("hello");
    });
  });
};

export { colorchoice }
