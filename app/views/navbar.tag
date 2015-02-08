<navbar>
  <header class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#home">Donovan Mikrot</a>
      </div>
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
      </div>
    </div>
  </header>

  this.active = riot.route.isCurrent;

</navbar>