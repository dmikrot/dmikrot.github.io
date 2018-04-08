<dm-app>
  <dm-nav pages={ opts.pages } page={ page }></dm-nav>
  <dm-life></dm-life>
  <div class="container page-container">
    <router>
      <route path="home">
        <home-page></home-page>
      </route>
      <route path="about">
        <about-page></about-page>
      </route>
      <route path="profiles">
        <profiles-page></profiles-page>
      </route>
    </router>
  </div>

  <script type="es6">
    const route = require('riot-route/tag');

    route((...path) => {
      if (!path.length || !path[0]) {
        route('home');
        return;
      }

      this.page = path[0];
      this.update();
    });
  </script>
</dm-app>
