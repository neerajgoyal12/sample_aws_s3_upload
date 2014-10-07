# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# slideIndex = 0
# jQuery ->
# 	$(".actions").on "click", ->
# 		console.log("submit button clicked !")
# $(".your-class").slick
# 	arrows: true
# 	dots: true
# 	autoplay: false
# $(".button").on "click", ->
# 	console.log("added slide" + slideIndex)
# 	$(".your-class").slickAdd "<div><img src=\"http://solarsystem.nasa.gov/images/VIIRS_4Jan2012_708x432.jpg\" width=\"600\" height=\"400\"></div>"
# 	slideIndex++
# 	# $(".your-class").slickGoTo slideIndex
# 	# $(".your-class").slickGoTo slideIndex <img src=\"http://solarsystem.nasa.gov/images/VIIRS_4Jan2012_708x432.jpg\" width=\"600\" height=\"400\">
add_button_count = 0
add_html = '<div><input type="file" id="photo-add" name="upload-file-"'+add_button_count+'/><a href="#" class="button" id="photo-add-button">+</a></div>'
add_html_dummy = '<div><a href="#" class="button" id="photo-add-dummy">Image</a></div>'
jQuery ->
	$(".small-slick").slick
		arrows: true
		autoplay: false
		slidesToShow: 5
		slidesToScroll: 0
	$(".small-slick").slickAdd add_html
	console.log("Added button");
	$('#photo-add-button').on 'click', ->		
		return if add_button_count >= 5
		$('#photo-add').focus().trigger('click')
	$('#photo-add').on 'change', (event) ->
		console.log('inside upload file change event '+add_button_count)
		console.log(event)
		console.log(event.target.files)
		if event.target.files.length > 0
			#$(".small-slick").slickRemove add_button_count - 1
			add_button_count++
			$(".small-slick").slickAdd add_html_dummy, true 
			console.log('count ' + add_button_count)
	