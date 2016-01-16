<home-page>
  <h3>
    <i class="material-icons small">home</i>
    Donovan Mikrot
    <br class="hide-on-med-and-up"/>
    <small><a class="unstyled" href="http://manifesto.softwarecraftsmanship.org/">Software Craftsman</a></small>
  </h3>
  <dm-welcome></dm-welcome>
  <dm-popouts></dm-popouts>
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
</dm-welcome>

<dm-popouts>
  <ul class="collapsible popout" data-collapsible="accordion">
    <li riot-tag="dm-popout" active="true" icon="face" title="Info for Anyone">
      Donovan: Urbanite. Nerd. Explorer.<br/><br/>
      Born in Shoreview, Minnesota. <a href="http://www.colostate.edu/">Colorado State University</a> alumnus. Resident of Minneapolis, Minnesota.<br/><br/>
      Head over the <a href="#about">about page</a> to learn more about who I am. Thanks for visiting!
    </li>
    <li riot-tag="dm-popout" icon="adb" title="Info for Developers">
      Technologies used to build this site:<br/><br/>
      <a href="https://nodejs.org/">Node</a>,
      <a href="http://bower.io/">Bower<a/>,
      <a href="http://brunch.io/">Brunch</a>,
      <a href="http://sass-lang.com/">Sass</a>,
      <a href="http://materializecss.com/">Materialize</a>,
      <a href="https://muut.com/riotjs/">Riot</a><br/><br/>
      Head over to <a href="https://github.com/dmikrot/dmikrot.github.io/tree/source">the GitHub repo</a> to view the source code.
    </li>
    <li riot-tag="dm-popout" icon="people" title="Info for Recruiters">
      How to get a response from me about a job:<br/><br/>
      I walk or bike to work, so please only send me info about jobs that are remote or near <a href="http://www.downtownmpls.com/">Downtown Minneapolis</a>.<br/><br/>
      I am not looking for temporary or contract work. I am not an independent consultant. Send me full-time employee positions only.<br/><br/>
      Include the name and website of the company you are recruiting for.<br/><br/>
      I list a lot of technologies on my résumé, so at least try to match my <a href="https://www.linkedin.com/in/donovanmn#background-skills">top skills on LinkedIn</a>. Hint: I built this site with technologies I'm interested in.
    </li>
  </ul>
</dm-popouts>

<dm-popout>
  <div class={ collapsible-header: true, active: opts.active }><i class="material-icons">{ opts.icon }</i>{ opts.title }</div>
  <div class="collapsible-body"><p class="flow-text"><yield/></p></div>
</dm-popout>
