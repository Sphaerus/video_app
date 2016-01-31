jQuery ->
	####video
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

	####	

	####image_upload
	getPicture = ->
		$.ajax
			dataType: "json"
			type: "get"
			url: "/movies/" + $('.movie').data("id") + "/last_image"
			complete: (data)->
				$('.images').append(data["responseText"])
				$('.upload-image').attr("disabled", false)

	$('.upload-image').click ->
		options = {success: getPicture}
		if $('.image-input input').val() != ""
			$('.upload-image').attr("disabled", true)
			$('.upload-form form').ajaxSubmit(options)

	##button
	$('.upload-image').attr("disabled", true)
	$('.image-input input').change ->
		if $(this).val() != ""
			$('.upload-image').attr("disabled", false)
		else
			$('.upload-image').attr("disabled", true)

	####	
	removeImage=(response)->
		id = response["id"]
		for image in $('*[data-id="' + id + '"]')
			$(image).remove()


	####image_deletion

	$(document).on 'click', '.delete-image', ->
		$.ajax
			dataType: "json"
			type: "delete"
			url: $(this).data("path")
			complete: (data)->
				removeImage(data["responseJSON"])
