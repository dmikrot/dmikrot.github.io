/* Include required views */
require('views/app');
require('views/navbar');
require('views/pages/home');
require('views/timesheet');

var pages = [
  {name: 'About', url: 'about'}
];
for(var i = 0; i < pages.length; ++i) {
  require('views/pages/' + pages[i].url);
};

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
riot.mount('app', {pages: pages});
$.material.init();