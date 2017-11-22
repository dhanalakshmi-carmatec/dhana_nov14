jQuery(document).on 'turbolinks:load', ->
  contact_addresses = $('#contact_addresses')

  contact_addresses.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)
 