/* Include required vendor scripts */
window.riot = require('riot');

/* Include required views */
require('views/dm-app');
require('views/dm-life');
require('views/dm-nav');
require('views/dm-brand-icon');

var pages = ['Home', 'About', 'Profiles'].map(function (name) {
  var url = name.toLowerCase();
  return { name: name, url: url, tag: url + '-page' };
});

pages.forEach(function (page) {
  require('views/pages/' + page.tag);
});

/* Start the app */
riot.mount('dm-app', { pages: pages });
