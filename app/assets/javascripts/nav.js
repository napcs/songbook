function navToggle() {
  var navtoggle = document.getElementById("navtoggle");
  var navElements = document.getElementById('navElements');
  navtoggle.addEventListener('click', function(e){
    navElements.style.display = (navElements.style.display === "none" ? "block" : "none");

  });

}

navToggle();
