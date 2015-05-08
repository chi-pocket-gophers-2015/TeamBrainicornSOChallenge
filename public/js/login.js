$(document).ready(function() {

  // adding ajax login functionality
  $(document).on('submit','#login-form', function(event) {
    event.preventDefault();
    console.log("what what login??");

    var request = $.ajax({
      url: '/login',
      method: 'post',
      data: $(this).serialize(),
      success: function(response) {
        $('.navbar-inverse').replaceWith(response);
      }
    });
  });

  $(document).on('submit','#logout-form', function(event) {
    event.preventDefault();
    console.log("what what logout??");

    var request = $.ajax({
      url: '/sessions',
      method: 'delete',
      success: function(response) {
        $('.navbar-inverse').replaceWith(response);
      }
    });

  });
});
