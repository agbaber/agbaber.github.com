(function() {
  var documentationHeight, sideNavHeight;

  sideNavHeight = $('.side-nav').height();

  documentationHeight = $('.documentation').height();

  if (documentationHeight > sideNavHeight) {
    $('.side-nav').height(documentationHeight);
  }

}).call(this);
