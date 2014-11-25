# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  engine = new Bloodhound
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    local: autocomplete_items
  
  engine.initialize()
  
  $('#auto_complete').typeahead null, {source: engine.ttAdaptor()}