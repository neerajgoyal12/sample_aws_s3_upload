# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$(".large-slick").slick
		slidesToShow: 1
		slidesToScroll: 1
		arrows: true
		fade: true
		asNavFor: ".small-slick"
	$(".small-slick").slick
		slidesToShow: 3
		slidesToScroll: 1
		dots: true
		asNavFor: ".large-slick"
		focusOnSelect: true
	$("#photo-add-button").on 'click', (event) ->
		$('#photo_image').focus().trigger('click')
	$('#photo_image').on 'change', (event) ->
		if event.target.files.length > 0
			formData = new FormData()
			formData.append 'photo[image]', $('#photo_image').get(0).files[0]
			$.ajax 
				url: '/photos'
				type: 'POST'
				data: formData
				cache: false
				contentType: false
				processData: false
				success: (data, status, xhr)  ->
					console.log('successfully added photo Status: ' + status)	
				complete: (xhr, status) ->
					console.log('Completed Ajax')
	# $('#delete-photo').on 'ajax:success', (data, status, xhr) ->
	# 	console.log('File deleted successful')
	# $('#delete-photo').on 'ajax:error', (xhr, status, e) ->
	# 	console.log('Status : ' + status + ' Error: ' + e)
	# $('#delete-photo').on 'ajax:beforeSend', (xhr, settings) ->
	# 	console.log('Before Sending Image')
	# $('#delete-photo').on 'ajax:complete', (xhr, status) ->
	# 	console.log('Completed Ajax')