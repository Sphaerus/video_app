jQuery ->
	video = $('video')[0]

	$('.slider').change ->
		video.volume = $(this).find('input').val()

	$('video').click ->
		if video.paused
			video.play()
		else
			video.pause()

	$('#seek-bar').change ->
  		time = video.duration * $('#seek-bar').val() /100
  		video.currentTime = time
  		return

	$('video').bind 'timeupdate', ->
		value = 100 / video.duration * video.currentTime
		$('#seek-bar').val(value)
		return

	$('#seek-bar').bind 'mousedown', ->
		video.pause()
		return

	$('#seek-bar').bind 'mouseup', ->
		video.play()
		return	
		