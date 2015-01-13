# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".articles.new").ready ->
  do initForm;
  return
  
$(".articles.edit").ready ->
  do initForm;
  return
  
initForm = ->
  engine = new Bloodhound {
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: "/tags.json?name=%QUERY",
      filter: (list) ->
        return $.map(list, (data) ->
          return { id: data.id, name: data.name }
        )
    }
  }
  
  engine.initialize()
  
  $('#auto_complete').tagsinput( itemValue: "id", itemText: "name", typeaheadjs: { name: "names", displayKey: "name", source: engine.ttAdapter(), autoselect: true } )
  tagsArray = $('#divTags').data('tags')
  for tag in tagsArray
    $('#auto_complete').tagsinput('add', tag)
  
  $('#article_text').wysihtml5()
  return