<dm-brand-icon>
  <svg ref="svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 140 140"
      width="35" height="35" style="vertical-align: sub;">
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

  <script type="es6">
    const Vivus = require('vivus');

    this.on('mount', () => {
      const svg = this.refs.svg;
      setTimeout(function () {
        const vivus = new Vivus(svg, {
          type: 'oneByOne',
          duration: 100,
        });
      }, 0);
    });
  </script>
</dm-brand-icon>
