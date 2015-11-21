<dm-app>
  <dm-nav pages={ opts.pages }></dm-nav>
  <div id="content" class="container">
    <div show={ isActive('home') }>
      <home-page></home-page>
    </div>
    <div show={ isActive('about') }>
      <about-page></about-page>
    </div>
    <div show={ isActive('profiles') }>
      <profiles-page></profiles-page>
    </div>
  </div>

  this.isActive = riot.route.isActive;

</dm-app>
