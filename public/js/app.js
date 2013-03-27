$(function(){
  $('.cat-button').click(function(e){
    hideOtherCats();
    $(this).addClass('cat-btn-select');
    // $(this).children('.dotted').children('li').addClass('.dotted-select');

    var subTask = $(this).parent().children('.sub-tasks');
    $(subTask).slideToggle(500, function(){
      if($(this).css('display') == 'none'){
        $(e.target).removeClass('cat-btn-select');
      }
    });
  });

  function hideOtherCats(){
    $('.sub-tasks').each(function(index){
      var catButton = $(this).parent().children('.cat-button');
      if ($(this).css('display') == 'block'){
        $(this).slideUp(500, function(){
          $(catButton).removeClass('cat-btn-select');
        });
      }
    });
  }

  $('.sub-task').click(function(){

  });

  $('.sub-tasks').hide();
});
