<dm-app>
  <dm-nav pages={ opts.pages }></dm-nav>
  <dm-life></dm-life>
  <div class="container page-container">
    <home-page class={ page: true, active: isActive('home') }></home-page>
    <about-page class={ page: true, active: isActive('about') }></about-page>
    <profiles-page class={ page: true, active: isActive('profiles') }></profiles-page>
  </div>

  this.isActive = riot.route.isActive;

</dm-app>
