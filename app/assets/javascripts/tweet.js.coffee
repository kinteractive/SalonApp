$(document).ready ->
  $.getJSON "https://api.twitter.com/users/show.json?screen_name=pinks623&count=1&callback=?", (data) ->
    $("#tweet").text data.status.text
    $("#tweet-time").text relTime(data.status.created_at)
    
relTime = (time_value) ->
  time_value = time_value.replace(/(\+[0-9]{4}\s)/g, "")
  parsed_date = Date.parse(time_value)
  relative_to = (if (arguments.length > 1) then arguments[1] else new Date())
  timeago = parseInt((relative_to.getTime() - parsed_date) / 1000)
  if timeago < 60
    "less than a minute ago"
  else if timeago < 120
    "about a minute ago"
  else if timeago < (45 * 60)
    (parseInt(timeago / 60)).toString() + " minutes ago"
  else if timeago < (90 * 60)
    "about an hour ago"
  else if timeago < (24 * 60 * 60)
    "about " + (parseInt(timeago / 3600)).toString() + " hours ago"
  else if timeago < (48 * 60 * 60)
    "1 day ago"
  else
    (parseInt(timeago / 86400)).toString() + " days ago"