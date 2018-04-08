// See http://brunch.io/#documentation for docs.
module.exports = {
  files: {
    javascripts: {
      joinTo: {
        'javascripts/app.js': /^app/,
        'javascripts/vendor.js': /^node_modules/,
      },
    },
    stylesheets: {
      joinTo: 'stylesheets/app.css',
    },
    templates: {
      joinTo: 'templates/app.js',
    },
  },
}
