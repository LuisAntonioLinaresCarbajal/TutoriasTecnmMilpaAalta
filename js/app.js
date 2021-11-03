//Navegation Menu
let bar_icon = document.querySelector('.bar-icon');
let nav = document.querySelector('.nav');
let enlaces = document.querySelector('.container-list');
let contador = true;

bar_icon.addEventListener('click', function(){
   this.classList.toggle('active');
   
   if (contador == true) {
     enlaces.style.width = '100%';
     enlaces.style.overflow = 'hidden';
     enlaces.style.transition = '0.5s';

     nav.style.background = '#f1f4df';
     nav.style.transition = '0.5s';

     contador = false;

   }else{
     contador = true;
     enlaces.style.width = '0%';
     enlaces.style.overflow = 'hidden';
     enlaces.style.transition = '0.5s';

     nav.style.background = 'transparent';
     nav.style.transition = '0.5s';

   }

});

