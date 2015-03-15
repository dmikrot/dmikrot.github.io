<navbar>
  <header class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <navbar-header></navbar-header>
      <navbar-collapse pages={ opts.pages}></navbar-collapse>
    </div>
  </header>
</navbar>

<navbar-header>
  <div class="navbar-header">
    <navbar-toggle></navbar-toggle>
    <a class="navbar-brand" href="#home">
      <brand-icon color="#fff" width="30" height="30"></brand-icon> Donovan Mikrot
    </a>
  </div>
</navbar-header>

<navbar-collapse>
  <div class="collapse navbar-collapse" id="navbar-collapse-1">
    <ul class="nav navbar-nav visible-xs-block">
      <li each={ opts.pages } class={ active: parent.active(url) }
          data-toggle="collapse" data-target="#navbar-collapse-1">
        <a href="#{url}">{name}</a>
      </li>
    </ul>
    <ul class="nav navbar-nav hidden-xs">
      <li each={ opts.pages } class={ active: parent.active(url) }>
        <a href="#{url}">{name}</a>
      </li>
    </ul>
    <navbar-links></navbar-links>
    <navbar-right></navbar-right>
  </div>

  this.active = riot.route.isCurrent;
</navbar-collapse>

<navbar-toggle>
  <button type="button" class="navbar-toggle collapsed"
      data-toggle="collapse" data-target="#navbar-collapse-1">
    <span class="sr-only">Toggle navigation</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>
</navbar-toggle>

<navbar-links>
  <ul class="nav navbar-nav">
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
          aria-expanded="false">
        Résumés
        <span class="caret"></span>
      </a>
      <ul class="dropdown-menu" role="menu">
        <li><a href="/static/Donovan_Mikrot_Resume.pdf">Résumé</a></li>
        <li><a href="/static/Donovan_Mikrot_Transcript.pdf">Transcript</a></li>
        <li><a href="https://hipcv.com/donovanmikrot/r/20150315">HipCV</a></li>
      </ul>
    </li>
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
          aria-expanded="false">
        Profiles
        <span class="caret"></span>
      </a>
      <ul class="dropdown-menu" role="menu">
        <li><a href="https://www.linkedin.com/in/donovanmn">LinkedIn</a></li>
        <li>
          <a href="https://plus.google.com/u/0/+DonovanMikrot42/posts">Google+</a>
        </li>
        <li><a href="https://twitter.com/donovan_mn">Twitter</a></li>
        <li><a href="https://www.fitbit.com/user/2F43YB">Fitbit</a></li>
        <li><a href="http://donovanmikrot.brandyourself.com/">BrandYourself</a></li>
        <li role="presentation" class="dropdown-header">Certifications</li>
        <li>
          <a href="http://www.scrumalliance.org/community/profile/dlind22">
            Scrum Certifications
          </a>
        </li>
      </ul>
    </li>
  </ul>
</navbar-links>

<navbar-right>
  <div class="navbar-right">
    <p class="navbar-text github-btn-frame">
      <iframe frameborder="0" scrolling="0" width="155px" height="20px"
          src="https://ghbtns.com/github-btn.html?user=dmikrot&type=follow&count=true">
      </iframe>
      <iframe frameborder="0" scrolling="0" width="100px" height="20px"
          src="https://ghbtns.com/github-btn.html?user=dmikrot&repo=dmikrot.github.io&type=watch&count=true&v=2">
      </iframe>
    </p>
  </div>
</navbar-right>