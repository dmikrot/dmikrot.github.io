<dm-nav>
  <dm-nav-dropdowns></dm-nav-dropdowns>
  <dm-nav-dropdowns mobile={ true }></dm-nav-dropdowns>
  <div class="navbar-fixed">
    <nav class="green lighten-1" role="navigation">
      <div class="nav-wrapper container">
        <dm-nav-brand></dm-nav-brand>
        <ul class="right hide-on-med-and-down">
          <dm-nav-pages pages={ opts.pages }></dm-nav-pages>
          <dm-nav-links></dm-nav-links>
        </ul>
        <ul id="nav-mobile" class="side-nav">
          <dm-nav-pages pages={ opts.pages }></dm-nav-pages>
          <dm-nav-links mobile={ true }></dm-nav-links>
        </ul>
        <dm-nav-toggle></dm-nav-toggle>
      </div>
    </nav>
  </div>
</dm-nav>

<dm-nav-brand>
  <a href="#" class="brand-logo">
    <dm-brand-icon color="#fff"></dm-brand-icon>
    <span class="hide-on-small-only">Donovan Mikrot</span>
  </a>
</dm-nav-brand>

<dm-nav-pages>
  <li each={ opts.pages } class={active: isActive(url) }>
    <a href="#{url}" class="waves-effect waves-light">{name}</a>
  </li>

  this.isActive = riot.route.isActive;
</dm-nav-pages>

<dm-nav-links>
  <li><a class="dropdown-button waves-effect waves-light" href="#" data-activates={ opts.mobile ? 'resumes-mobile' : 'resumes'}>Résumés<i class="material-icons right">arrow_drop_down</i></a></li>
</dm-nav-links>

<dm-nav-toggle>
  <a class="button-collapse" href="#" data-activates="nav-mobile"><i class="material-icons">menu</i></a>
</dm-nav-toggle>

<dm-nav-dropdowns>
  <ul id="{ opts.mobile ? 'resumes-mobile' : 'resumes'}" class="dropdown-content">
    <li><a href="/static/Donovan_Mikrot_Resume.pdf">Résumé</a></li>
    <li><a href="/static/Donovan_Mikrot_Transcript.pdf">Transcript</a></li>
    <li><a href="https://hipcv.com/donovanmikrot/r/20150315">HipCV</a></li>
  </ul>
</dm-nav-dropdowns>
