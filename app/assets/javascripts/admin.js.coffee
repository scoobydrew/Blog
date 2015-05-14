# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(".admin.admin").ready ->
	$('*[data-newtag]').click (event)->
		event.preventDefault()
		do newTag;
		return
	return

newTag = ->
	listItem = $ "<div class = 'list-group-item clearfix'><div><%= tag.text %><%= link_to 'Edit', edit_article_path(article) %><%= link_to 'Destroy', article_path(article),method: :delete, data: { confirm: 'Are you sure?' } %></div></div>"
	$('#listTags').append(listItem)
	return

postTag = ->
	$.ajax
		type:'POST'
		url:'/admin/newTag'
		data: "name" : "test"
		success: () ->
			$(this).addClass('done');
	return
		


