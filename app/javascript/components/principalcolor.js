
function colorchoice () {

  document.querySelectorAll('.color-choice').forEach((color_choice) => {
    color_choice.addEventListener('click', (event) => {
      event.currentTarget.parentNode.querySelectorAll('.color-choice').forEach((color_choice)=> {
       color_choice.classList.remove("active")
      });
      event.currentTarget.classList.add("active")
    });
  });
};

export { colorchoice }
