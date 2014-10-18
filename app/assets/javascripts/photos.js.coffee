# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
add_html = '<div><img src="ajax-loader.gif" alt="Loading" height="50" width="50"></div>'
jQuery ->
	$('#fileupload').fileupload()
	$(".large-slick").slick
		slidesToShow: 1
		slidesToScroll: 1
		arrows: false
		fade: true
		asNavFor: ".small-slick"
	$(".small-slick").slick
		slidesToShow: 1
		slidesToScroll: 1
		arrows: true
		asNavFor: ".large-slick"
		focusOnSelect: true
	$("#photo-add-button").on 'click', (event) ->
		$('#photo_image').focus().trigger('click')
	$('#fileupload').fileupload	
		start: (e) ->
			# $('small-slick').slickAdd(add_html)
			# $('large-slick').slickAdd(add_html)
			console.log('Started ')
		change: (e, data) ->
			console.log('File Input Changed ' + data)
		done: (e, data) ->
			# $('small-slick').slickRemove()
			# $('large-slick').slickRemove()
			console.log("Done Uploading : "+data)
		progressall: (e, data) ->
			progress = parseInt(data.loaded / data.total * 100, 10)
			console.log('Progress - '+progress+'%')
	
	# $('#photo_image').on 'change', (event) ->
		# if event.target.files.length > 0
			# $('#fileupload').fileupload
			# 	# add: (e, data) ->
			# 		# jqXHR = data.submit()
			# 	start: (e) ->
			# 		console.log('Started ')
			# 	change: (e, data) ->
			# 		console.log('File Input Changed ' + data)
			# 	done: (e, data) ->
			# 		console.log("Done Uploading : "+data)
			# 	progressall: (e, data) ->
			# 		progress = parseInt(data.loaded / data.total * 100, 10)
			# 		console.log('Progress - '+progress+'%')
			# formData = new FormData()
			# formData.append 'photo[image]', $('#photo_image').get(0).files[0]
			# $.ajax
			# 	url: '/photos'
			# 	type: 'POST'
			# 	data: formData
			# 	cache: false
			# 	contentType: false
			# 	processData: false
			# 	success: (data, status, xhr)  ->
			# 		console.log('successfully added photo Status: ' + status)
			# 	complete: (xhr, status) ->
			# 		console.log('Completed Ajax')
	# $('#delete-photo').on 'ajax:success', (data, status, xhr) ->
	# 	console.log('File deleted successful')
	# $('#delete-photo').on 'ajax:error', (xhr, status, e) ->
	# 	console.log('Status : ' + status + ' Error: ' + e)
	# $('#delete-photo').on 'ajax:beforeSend', (xhr, settings) ->
	# 	console.log('Before Sending Image')
	# $('#delete-photo').on 'ajax:complete', (xhr, status) ->
	# 	console.log('Completed Ajax')