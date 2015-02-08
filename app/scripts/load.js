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

function isCurrent() {
  var same = true;
  var args = Array.prototype.slice.call(arguments);
  riot.route.exec(function getPage() {
    if (args.length !== arguments.length) {
      same = false;
    } else {
      for (var i = 0; i < args.length; ++i) {
        if (args[i] !== arguments[i]) {
          same = false;
          break;
        }
      }
    }
  });
  return same;
}

riot.route.isCurrent = isCurrent;

/* Start the app */
riot.mount('app');
$.material.init();