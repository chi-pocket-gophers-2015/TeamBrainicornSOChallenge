$(document).ready(function() {

  $('.glyphicon-chevron-up').click(function(event){
    event.preventDefault();

    var myParent = $(this).parent().parent();
    var type = myParent.attr('class');
    var id = myParent.attr('data-id');
    var button = $(this)

    var request = $.ajax({
      url: '/votes',
      method: 'post',
      data: {
        voteable_id: id,
        voteable_type: type,
        up: true
      },
      success: function(response) {
        var scoreSpan = myParent.children(".voting_button").children(".score");
        // debugger;
        scoreSpan.html(""),
        scoreSpan.append(response.score),
        button.css('color', 'green')
        myParent.find('.glyphicon-chevron-down').css('color', 'black')
      }
    });



  // end upvoting button block
  });


  $('.glyphicon-chevron-down').click(function(event){
    event.preventDefault();

    var myParent = $(this).parent().parent();
    var type = myParent.attr('class');
    var id = myParent.attr('data-id');
    var button = $(this)

    var request = $.ajax({
      url: '/votes',
      method: 'post',
      data: {
        voteable_id: id,
        voteable_type: type,
        up: false
      },
      success: function(response) {
        var scoreSpan = myParent.children(".voting_button").children(".score")
        // debugger;
        scoreSpan.html(""),
        scoreSpan.append(response.score)
        button.addClass("downvoted")
        myParent.find('.glyphicon-chevron-up').css('color', 'black')
        // $('.glyphicon-chevron-up').css('color', 'black')
        button.css('color', 'red').toggle
      }
    });



  // end downvoting button block
  });




});
