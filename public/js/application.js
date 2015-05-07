$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


  // trying to add new-comment button functionality here:
  $('.comment_link').click(function(event){
    event.preventDefault();

    var myParent = $(this).parent();

    var request = $.ajax({
      url: '/comments/new',
      method: 'get'
    });

    request.success(function(response){
      myParent.append(response);
    });

    $(this).hide();
  // end #add_comment block
  });

  $(document).on('submit','.comment_form',function(event) {
    event.preventDefault();

    var myParent = $(this).parent();
    var type = myParent.attr('class');
    var id = myParent.attr('data-id');
    // debugger;
    var request = $.ajax({
      url: '/comments',
      method: 'post',
      data: {
        content: this.content.value,
        commentable_id: id,
        commentable_type: type
      }
    });

    $('.comment_form').hide();

    request.done(function(response){
      debugger;
      // $('.comments').append(response);
      $(this).parent().append(response);
      $('.comment_link').show();
      // $(this).hide();
      $('div[data-id='+id+']')
    });

  // end comment_form block
  });



// end document.ready
});
