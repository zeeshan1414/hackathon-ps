import 'tablesorter'

$(document).on('turbolinks:load', (function() {
  // Table Sorting
  $('#challenge-table').tablesorter({
    theme: 'bootstrap',
    widthFixed: true
  })

}))
