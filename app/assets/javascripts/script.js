$(document).ready(function () {
  var hue = parseInt(Math.random() * 360);
  var hueVar =  "hue-rotate(" + hue + "deg)";
  $(".header-container").css("filter", hueVar);
  $(".header-container").css("-webkit-filter", hueVar);
  $(".btn-primary").css("filter", hueVar);
  $(".btn-primary").css("-webkit-filter", hueVar);
  $("#main-logo").css("color", hueVar);

  $("#add-review").click(function () {
    $("#review-form").toggle();
  });
});
