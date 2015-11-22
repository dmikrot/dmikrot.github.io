/* Include required views */
require('views/dm-app');
require('views/dm-brand-icon');
require('views/dm-nav');
require('views/dm-life');
require('views/dm-timesheet');

var pages = [
  {name: 'Home', url: 'home'},
  {name: 'About', url: 'about'},
  {name: 'Profiles', url: 'profiles'}
];
for(var i = 0; i < pages.length; ++i) {
  require('views/pages/' + pages[i].url + '-page');
};

var activePage;
function setPage() {
  activePage = Array.prototype.slice.call(arguments);
  if (!activePage.length || !activePage[0]) {
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
riot.mount('dm-app', {pages: pages});

$(function () {
  $('.button-collapse').sideNav();
});
