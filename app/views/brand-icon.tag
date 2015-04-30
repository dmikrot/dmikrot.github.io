<brand-icon>
  <svg id="{ brand_icon_id }" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 140 140"
      width="{ opts.width }" height="{ opts.height }">
    <circle cx="3" cy="1" r="0.45" transform="matrix(20,0,0,20,10,10)"
      style="fill:none;stroke:{ opts.color }"/>
    <circle cx="5" cy="3" r="0.45" transform="matrix(20,0,0,20,10,10)"
      style="fill:none;stroke:{ opts.color }"/>
    <circle cx="5" cy="5" r="0.45" transform="matrix(20,0,0,20,10,10)"
      style="fill:none;stroke:{ opts.color }"/>
    <circle cx="3" cy="5" r="0.45" transform="matrix(20,0,0,20,10,10)"
      style="fill:none;stroke:{ opts.color }"/>
    <circle cx="1" cy="5" r="0.45" transform="matrix(20,0,0,20,10,10)"
      style="fill:none;stroke:{ opts.color }"/>
  </svg>

  var utils = require('scripts/utils');

  this.brand_icon_id = 'brand-icon' + utils.get_random_id();

  this.on('mount', function on_mount() {
    var container = this['{ brand_icon_id }'];
    setTimeout(function () {
      var vivus = new Vivus(container, {
        type: 'oneByOne',
        duration: 100
      });
    }, 0);
  });

</brand-icon>