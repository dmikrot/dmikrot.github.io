<profiles-page>
  <h3><i class="material-icons small">web</i> Profiles</h3>
  <div class="row">
    <dm-profile src="/img/github.png" url="https://github.com/dmikrot">
      GitHub
    </dm-profile>
    <dm-profile src="/img/linkedin.png" url="https://www.linkedin.com/in/donovanmn">
      LinkedIn
    </dm-profile>
    <dm-profile src="/img/scrum.png" url="http://www.scrumalliance.org/community/profile/dlind22">
      Scrum certification
    </dm-profile>
    <dm-profile src="/img/twitter.png" url="https://twitter.com/donovan_mn">
      Twitter
    </dm-profile>
    <dm-profile src="/img/google-plus.png" url="https://plus.google.com/u/0/+DonovanMikrot42/posts">
      Google+
    </dm-profile>
    <dm-profile src="/img/fitbit.png" url="https://www.fitbit.com/user/2F43YB">
      Fitbit
    </dm-profile>
    <dm-profile src="/img/yelp.png" url="http://www.yelp.com/user_details?userid=nGEbJGyyNaIY_OmLiPFI5Q">
      Yelp
    </dm-profile>
    <dm-profile src="/img/steam.png" url="https://steamcommunity.com/id/donovanmn/">
      Steam
    </dm-profile>
    <dm-profile src="/img/brand-yourself.png" url="http://donovanmikrot.brandyourself.com/">
      Brand Yourself
    </dm-profile>
  </div>
</profiles-page>

<dm-profile>
  <div class="col l4 m6 s12">
    <div class="card small">
      <div class="card-image">
        <img src={ opts.src }>
      </div>
      <div class="card-content"><yield/></div>
      <div class="card-action">
        <a href={ opts.url }>View Profile</a>
      </div>
    </div>
  </div>

  <style scoped>
    .card-image {
      height: 175px;
    }
  </style>
</dm-profile>
