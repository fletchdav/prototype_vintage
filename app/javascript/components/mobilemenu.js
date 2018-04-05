
function mobilemenu () {
  let hamburger = document.querySelector('#hamburger');
  let mobilmenu = document.querySelector('.mobilemenu');
  hamburger.addEventListener('click', () => {
  mobilmenu.classList.toggle('hidden');
  });
}


export { mobilemenu }
