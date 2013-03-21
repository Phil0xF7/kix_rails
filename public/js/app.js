$(function(){
  $('.cat-button').click(function(e){
    $(this).parent().children('.sub-tasks').slideToggle(500, function(){
    });
  });

  $('.sub-tasks').hide();
});
