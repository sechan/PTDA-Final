// Javascript handling functionality on the main page

$(document).ready(function(){

  var myIndex = 0;
  carousel();

  // Slideshow on the home page - change image every 3 seconds
  function carousel() {
    var i;
    var x = document.getElementsByClassName("homeSlides");

    for(i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    myIndex++;
    if(myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 3000);
  };
});