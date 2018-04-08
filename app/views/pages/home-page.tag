<home-page>
  <h3>
    <i class="material-icons small">home</i>
    Donovan Mikrot
    <br class="hide-on-med-and-up"/>
    <small><a class="unstyled" href="http://manifesto.softwarecraftsmanship.org/">Software Craftsman</a></small>
  </h3>
  <dm-welcome></dm-welcome>
  <dm-popouts></dm-popouts>

  <style scoped>
    .unstyled {
      color: #444;
    }
  </style>
</home-page>

<dm-welcome>
  <div class="card-panel">
    <h4>Hello, friend!</h4>
    <p class="flow-text">
      Hi, I'm Donovan.
      I built this website to learn some new technolgies and showcase my skills.
      This website is
      <a href="http://en.wikipedia.org/wiki/Open-source_software">open source</a>
      and publicly
      <a href="https://github.com/dmikrot/dmikrot.github.io">hosted on GitHub</a>.
      I also hope someone will use it as an example for learning.
    </p>
  </div>

  <style scoped>
    h4 {
      margin-top: 0;
    }
  </style>
</dm-welcome>

<dm-popouts>
  <ul ref="collapsible" class="collapsible popout">
    <li data-is="dm-popout" icon="face" title="Info for Anyone">
      Donovan: Urbanite. Nerd. Explorer.<br/><br/>
      Born in Shoreview, Minnesota. <a href="http://www.colostate.edu/">Colorado State University</a> alumnus. Resident of Minneapolis, Minnesota.<br/><br/>
      Head over the <a href="#about">about page</a> to learn more about who I am. Thanks for visiting!
    </li>
    <li data-is="dm-popout" icon="adb" title="Info for Developers">
      Technologies used to build this site:<br/><br/>
      <a href="https://nodejs.org/">Node</a>,
      <a href="http://bower.io/">Bower<a/>,
      <a href="http://brunch.io/">Brunch</a>,
      <a href="http://sass-lang.com/">Sass</a>,
      <a href="http://materializecss.com/">Materialize</a>,
      <a href="https://muut.com/riotjs/">Riot</a><br/><br/>
      Head over to <a href="https://github.com/dmikrot/dmikrot.github.io/tree/source">the GitHub repo</a> to view the source code.
    </li>
    <li data-is="dm-popout" icon="people" title="Info for Recruiters">
      How to get a response from me about a job:<br/><br/>
      I walk or bike to work, so please only send me info about jobs that are remote or near <a href="http://www.downtownmpls.com/">Downtown Minneapolis</a>.<br/><br/>
      I am not looking for temporary or contract work. I am not an independent consultant. Send me full-time employee positions only.<br/><br/>
      Include the name and website of the company you are recruiting for.<br/><br/>
      I list a lot of technologies on my résumé, so at least try to match my <a href="https://www.linkedin.com/in/donovanmn#background-skills">top skills on LinkedIn</a>. Hint: I built this site with technologies I'm interested in.
    </li>
  </ul>

  <script type="es6">
    const M = require('materialize-css');

    let collapsible;

    this.on('mount', () => {
      collapsible = M.Collapsible.init(this.refs.collapsible);
      collapsible.open(0);
    });

    this.on('unmount', () => {
      collapsible.destroy();
    });
  </script>
</dm-popouts>

<dm-popout>
  <div class="collapsible-header"><i class="material-icons">{ opts.icon }</i>{ opts.title }</div>
  <div class="collapsible-body"><p class="flow-text"><yield/></p></div>

  <style>
    .collapsible-body {
      background: #fff;
    }

    .collapsible-body > .flow-text {
      margin: 0;
    }
  </style>
</dm-popout>
