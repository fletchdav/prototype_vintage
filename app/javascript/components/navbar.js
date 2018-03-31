
let navbar = document.querySelector('.navbar-wagon');
let lastScrollTop = 0;

function navbardown () {
  window.addEventListener('scroll', () => {
  var st = window.pageYOffset || document.documentElement.scrollTop;
  if (st > lastScrollTop){
    navbar.classList.add('navbar-hidden');
   } else {
    navbar.classList.remove('navbar-hidden');
   }
  lastScrollTop = st;
  });
};

export { navbardown }
