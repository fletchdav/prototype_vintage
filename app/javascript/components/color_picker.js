
function betterColorPicker () {
  document.querySelectorAll('.article-color').forEach((rond)=> {
    rond.addEventListener('click', event => {
      rond.classList.toggle('active');
      rond.nextElementSibling.classList.toggle('active');
      let cards = document.querySelectorAll('.colcard');
      let active_ronds = document.querySelectorAll('.article-color.active');
      let active_ronds_datasets = [];
      active_ronds.forEach((rond) => {
        active_ronds_datasets.push(rond.dataset.color)
      });
      console.log(active_ronds_datasets);
      cards.forEach((card) =>{
      if (active_ronds_datasets.length > 0) {
        if (active_ronds_datasets.includes(card.dataset.color) == false) {
          card.classList.add("hidden");
          } else {
            card.classList.remove("hidden");
          }
        } else {
        card.classList.remove("hidden");
        }
      });
    });
  });
}

export { betterColorPicker }
