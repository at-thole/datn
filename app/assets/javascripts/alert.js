$(document).ready(function() {
  window.setTimeout(function() {
    $('.alert').slideUp(500, function() {
      $('.alert').hide();
    });
  }, 3000);
});
