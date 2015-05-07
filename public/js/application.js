$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


  // trying to add new-comment button functionality here:
  $('.comment_link').click(function(event){
    event.preventDefault();

    var myParent = $(this).parent().parent();

    var request = $.ajax({
      url: '/comments/new',
      method: 'get'
    });

    request.success(function(response){
      myParent.children('.content').append(response);
    });

    $(this).hide();
  // end .comment_link block
  });

  $(document).on('submit','.comment_form',function(event) {
    event.preventDefault();

    var myParent = $(this).parent().parent();
    var type = myParent.attr('class');
    var id = myParent.attr('data-id');

    var request = $.ajax({
      url: '/comments',
      method: 'post',
      data: {
        content: this.content.value,
        commentable_id: id,
        commentable_type: type
      },
      success: function(response) {
        myParent.find('ul').append(response),
        $('.comment_form').hide();
        $('.comment_link').show();
      }
    });

    // end 'comment_form block'
  });


  // adding ajax login functionality
  $('#login').click(function() {
    var username = $('input[name=username]').val();
    var password = $('input[name=password]').val();

    var request = $.ajax({
      url: '/'
    })
  });


// end document.ready
});
