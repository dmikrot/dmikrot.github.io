<app>
  <navbar pages={ opts.pages }></navbar>
  <div id="content" class="container">
    <div if={ currentPage('home') }>
      <home></home>
    </div>
    <div if={ currentPage('about') }>
      <about></about>
    </div>
  </div>

  this.currentPage = riot.route.isCurrent;

</app>