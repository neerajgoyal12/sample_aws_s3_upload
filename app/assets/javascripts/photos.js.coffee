# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
add_button_count = 0
add_html = '<div><input id="photo_image" name="photo[image]" type="file" /><input id="photo-add-button" name="commit" type="submit" value="Add Photo" /></div>'
add_html_dummy = '<div><a href="#" class="button" id="photo-add-dummy">Image</a></div>'
jQuery ->
	$(".large-slick").slick
		slidesToShow: 1
		slidesToScroll: 1
		arrows: false
		fade: true
		asNavFor: ".small-slick"
	$(".small-slick").slick
		slidesToShow: 3
		slidesToScroll: 1
		asNavFor: ".large-slick"
		focusOnSelect: true
	$("#photo-add-button").on 'click', (event) ->
		$('#photo_image').focus().trigger('click')
	$('#photo_image').on 'change', (event) ->
		console.log(event)
		console.log(event.target.files)
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
				success: ->
					console.log('successfully added photo ' + add_button_count)
					add_button_count++				
				# $(".small-slick").slickAdd add_html_dummy, true
	# $(".small-slick").slickAdd add_html
# 	console.log("Added button");
# 	$('#photo-add-button').on 'click', ->
# 		return if add_button_count >= 5
# 		console.log('count ' + $('#photo-image'))
# 		$('#photo_image').focus().trigger('click')
# 	$('#photo_image').on 'change', (event) ->
# 		console.log('inside upload file change event '+add_button_count)
# 		console.log(event)
# 		console.log(event.target.files)
# 		if event.target.files.length > 0
# 			console.log('count 1' + add_button_count)
			# $('#photo-add-button').trigger('click')
# 	$('#photo-add-button').on 'click', ->
# 		console.log('inside photo-add-button '+add_button_count)
# 		add_button_count++
# 		$(".small-slick").slickAdd add_html_dummy, true
# 		console.log('count 3' + add_button_count)
	