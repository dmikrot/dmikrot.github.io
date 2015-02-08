/* Include required views */
require('views/app');
require('views/navbar');
require('views/pages/home');
require('views/pages/about');

function setPage(page) {
  if (!page) {
    riot.route('home');
    return;
  }
  riot.update();
}

riot.route(setPage);
riot.route.exec(setPage);

/* Start the app */
riot.mount('app');
$.material.init();