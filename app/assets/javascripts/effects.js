"use strict";
$(document).ready(function () {
  let hue = parseInt(Math.random() * 360);
  $(".header-container").css("filter", String(`hue-rotate(${ hue }deg)`));
  $(".header-container").css("-webkit-filter", String(`hue-rotate(${ hue }deg)`));
  $(".btn-primary").css("filter", String(`hue-rotate(${ hue }deg)`));
  $(".btn-primary").css("-webkit-filter", String(`hue-rotate(${ hue }deg)`));
  $("#main-logo").css("color", String(`hue-rotate(${ hue }deg)`));
});
