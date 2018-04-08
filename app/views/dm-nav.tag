<dm-nav>
  <dm-nav-dropdowns></dm-nav-dropdowns>
  <dm-nav-dropdowns mobile={ true }></dm-nav-dropdowns>
  <div class="navbar-fixed">
    <nav class="green lighten-1" role="navigation">
      <div class="nav-wrapper row">
        <div class="col s12">
          <a href="#" class="brand-logo">
            <dm-brand-icon color="#fff"></dm-brand-icon>
            <span class="hide-on-small-only">Donovan Mikrot</span>
          </a>
          <ul class="right hide-on-med-and-down" data-is="dm-nav-links"
               pages={ opts.pages } page={ opts.page }>
          </ul>
          <dm-nav-toggle></dm-nav-toggle>
        </div>
      </div>
    </nav>
  </div>
  <dm-sidenav pages={ opts.pages } page={ opts.page }></dm-sidenav>
</dm-nav>

<dm-sidenav>
  <ul id="nav-mobile" ref="sidenav" class="sidenav" data-is="dm-nav-links"
      pages={ opts.pages } page={ opts.page } mobile={ true }>
  </ul>

  <script type="es6">
    const M = require('materialize-css');

    let sidenav;

    this.on('mount', () => {
      sidenav = M.Sidenav.init(this.refs.sidenav.root);
    });

    this.on('unmount', () => {
      sidenav.destroy();
    });
  </script>
</dm-sidenav>

<dm-nav-links>
  <li each={ opts.pages } class={ active: url === opts.page }>
    <a href="#{url}" onclick={ hideSideNav }>{name}</a>
  </li>
  <li>
    <a ref="dropdownTrigger" class="dropdown-trigger"
        href="#" data-target={ opts.mobile ? 'resumes-mobile' : 'resumes'}>
      Résumés
      <i class="material-icons right">arrow_drop_down</i>
    </a>
  </li>

  <script type="es6">
    const M = require('materialize-css');
    let dropdown;

    this.on('mount', () => {
      dropdown = M.Dropdown.init(this.refs.dropdownTrigger);
    });

    this.on('unmount', () => {
      dropdown.destroy();
    });

    //class={ active: isActive(url) }

    this.hideSideNav = () => {
      M.Sidenav.getInstance(document.querySelector('.sidenav')).close();
    };
  </script>

  <style>
    .sidenav > li.active {
      background-color: #c8e6c9;
    }

    .sidenav > li:hover {
      background-color: #a5d6a7;
    }
  </style>
</dm-nav-links>

<dm-nav-toggle>
  <a class="sidenav-trigger" href="#" data-target="nav-mobile">
    <i class="material-icons">menu</i>
  </a>
</dm-nav-toggle>

<dm-nav-dropdowns>
  <ul id="{ opts.mobile ? 'resumes-mobile' : 'resumes'}" class="dropdown-content">
    <li><a href="/static/Donovan_Mikrot_Resume.pdf" target="_top">Résumé</a></li>
    <li><a href="/static/Donovan_Mikrot_Transcript.pdf" target="_top">Transcript</a></li>
    <li><a href="https://hipcv.com/donovanmikrot/r/20150315">HipCV</a></li>
  </ul>

  <style scoped>
    .dropdown-content li > a {
      color: #039be5;
    }
  </style>
</dm-nav-dropdowns>
