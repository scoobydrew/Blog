# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".articles.new").ready ->
  engine = new Bloodhound {
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: "/tags.json"
  }
  
  engine.initialize()
  
  $('#auto_complete').tagsinput( typeaheadjs: { name: "names", displayKey: "name", valueKey: 'name', source: engine.ttAdapter()} )
  
  # $('#auto_complete').on 'typeahead:selected', (event, selection) ->
    # alert selection.name
    # $('#auto_complete').typeahead 'val', ''
    # event.stopPropagation()
    # return
  return