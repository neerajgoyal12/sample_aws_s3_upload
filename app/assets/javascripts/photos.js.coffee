# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
slideIndex = 0
jQuery ->
	$(".actions").on "click", ->
		console.log("submit button clicked !")
$(".your-class").slick
	arrows: true
	dots: true
	autoplay: false
$(".button").on "click", ->
	console.log("added slide" + slideIndex)
	$(".your-class").slickAdd "<div><img src=\"http://solarsystem.nasa.gov/images/VIIRS_4Jan2012_708x432.jpg\" width=\"600\" height=\"400\"></div>"
	slideIndex++
	# $(".your-class").slickGoTo slideIndex
	# $(".your-class").slickGoTo slideIndex <img src=\"http://solarsystem.nasa.gov/images/VIIRS_4Jan2012_708x432.jpg\" width=\"600\" height=\"400\">