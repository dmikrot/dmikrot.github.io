<app>
  <navbar pages={ opts.pages }></navbar>
  <div id="content" class="container">
    <div if={ isActive('home') }>
      <home></home>
    </div>
    <div if={ isActive('about') }>
      <about></about>
    </div>
  </div>

  this.isActive = riot.route.isActive;

</app>