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
			console.log('Started ')
		change: (e, data) ->
			console.log('File Input Changed ' + data)
		done: (e, data) ->
			console.log("Done Uploading : "+data)
		progressall: (e, data) ->
			progress = parseInt(data.loaded / data.total * 100, 10)
			console.log('Progress - '+progress+'%')