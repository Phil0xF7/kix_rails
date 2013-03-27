# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ()->
  TYPES = [
            "story-main",
            "story-long",
            "story-email",
            "story-edit-content",
            "story-perspective",

            "fin_goal",
            "fin_rewards",
            "fin_fulfill",
            "fin_stretch_goals",
            "fin_math",

            "net_website",
            "net_friends",
            "net_social_media",
            "net_blog",
            "net_events",

            "video_videographer",
            "video_storyboard",
            "video_filming",
            "video_editing",
            "video_sharing",

            "marketing_print_material",
            "marketing_events",
            "marketing_networking",
            "marketing_web_visibility",
            "marketing_friends"
          ]

  $('.cat-button').click (e)->
    target = e.currentTarget
    subTask = $(this).parent().children('.sub-tasks')

    # Remove any select classes from subtask buttons.
    $('.sub-task').trigger('deselect')

    if subTask.css('display') != 'block'
      $('.sub-tasks').trigger('hide_open_lists')
      $(this).addClass('select')
      $(this).children('.dotted').children('li').addClass('select')

      $(subTask).slideToggle 500, ()->
        if($(this).css('display') == 'none')
          $(target).removeClass('select')
          return true
      return true
    else
      $(subTask).slideToggle 500, ()->
        $(target).removeClass('select')
        $(target).children('.dotted').children('li').removeClass('select')
        return true

  $('.sub-tasks').on 'hide_open_lists', (e)->
    catButton = $(this).parent().children('.cat-button')
    if $(this).css('display') == 'block'
      $(catButton).removeClass('select')
      $(catButton).children('.dotted').children('li').removeClass('select')
      $(this).slideUp(500)
      return true
    return true

  # Subtask Code
  $('.sub-task').on 'deselect', ->
    $(this).removeClass('select')
    subBadge = $(this).children('.sub-badge')
    if $(subBadge).hasClass('select')
      $(subBadge).removeClass('select')
    return true

  $('.sub-task').click ->
    $('.sub-task').trigger('deselect')
    $(this).addClass('select')
    subBadge = $(this).children('.sub-badge')
    if $(subBadge).hasClass('complete')
      $(subBadge).addClass('select')
    return true

  # Progress bar code
  setMainProgressBar = (completed_tasks)->
      if completed_tasks > 25
        completed_tasks = 25
        return true
      increment = 493/25
      bar_width = (increment * completed_tasks) + "px"
      $('#progress-bar-main').css('width', bar_width)
      return true

  setSubProgressBar = (cat, completed_tasks)->
    pBar = '#' + cat + ' .dotted li'
    $(pBar).removeClass 'complete'
    pBar = '#' + cat + ' .dotted li:nth-child(-n' + completed_tasks + ')'
    $(pBar).addClass 'complete'
    return true

  setTaskComplete = (subtask, state) ->
    taskId = "#" + subtask
    badgeClass = ".sub-badge"
    if state == 1
      $(taskId + " " + badgeClass).removeClass('incomplete').addClass('complete')
    else
      $(taskId + " " + badgeClass).removeClass('complete').addClass('incomplete')

  setDaysLeft = (launchDate)->
    nowDate = new Date()
    daysLeft = Math.ceil((launchDate - nowDate) / 1000 / 60 / 60 / 24)
    console.log daysLeft
    daysLeft += " days left"
    $('#flag').html daysLeft
    return true

  $("#cb-story-main").change ->
    category = $(this).data('cat')
    subtask = $(this).attr('name')
    if $(this).is(':checked')
      state = 1
    else
      state = 0
    setTaskComplete(subtask, state);
    # count the number of tasks in this category that are complete
    cat_tasks_complete = $("#" + category + " .sub-task .complete").size()
    setSubProgressBar(category, cat_tasks_complete);
    #
    #Can also use this to check tasks $('.task-cb:checked').size()
    total_tasks_complete = $(".sub-task .complete").size()
    setMainProgressBar(total_tasks_complete)

  init = ->
    $('.sub-tasks').hide();
    # setMainProgressBar(6);
    # setSubProgressBar('story', 3);
    # setSubProgressBar('video', 2);
    # setDaysLeft(new Date("2013-04-27 11:23:00"));

  init()

