/* Include required views */
require('views/app');
require('views/brand-icon');
require('views/navbar');
require('views/pages/home');
require('views/timesheet');

var pages = [
  {name: 'About', url: 'about'}
];
for(var i = 0; i < pages.length; ++i) {
  require('views/pages/' + pages[i].url);
};

var activePage;
function setPage() {
  activePage = Array.prototype.slice.call(arguments);
  if (!activePage.length) {
    riot.route('home');
    return;
  }
  riot.update();
}

riot.route(setPage);

function isActive() {
  var page = Array.prototype.slice.call(arguments);
  var same = true;
  if (page.length !== activePage.length) {
    same = false;
  } else {
    for (var i = 0; i < page.length; ++i) {
      if (page[i] !== activePage[i]) {
        same = false;
        break;
      }
    }
  }
  return same;
}

riot.route.isActive = isActive;

/* Start the app */
riot.route.start(true);
riot.mount('app', {pages: pages});
$.material.init();
