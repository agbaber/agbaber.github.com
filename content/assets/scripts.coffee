sideNavHeight = $('.side-nav').height()
documentationHeight = $('.documentation').height()

$('.side-nav').height(documentationHeight) if documentationHeight > sideNavHeight
