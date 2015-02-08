<app>
  <navbar></navbar>
  <div id="content" class="container">
    <div if={ current_page('home') }>
      <home></home>
    </div>
    <div if={ current_page('about') }>
      <about></about>
    </div>
  </div>

  this.current_page = function(name) {
    var same = false;
    riot.route.exec(function(page) {
      same = page === name;
    });
    return same;
  };

</app>