/* this entire thing is duplicated in the fret board file */
function appendChordContent() {
  var numStrings = 6;
  var snippet = $('#snippet span');
  var chord = snippet.text().split('|');
  var updatedStrings = [];
  $.each(chord, function(index, value) {
    var note = value.split(',');
    var string = note[0];
    var fret = note[1];
    var newRowContent;

    for (stringNumber = numStrings; stringNumber > 0; stringNumber--) {
      if (stringNumber === parseInt(string)) {
        updatedStrings.push(stringNumber)
        newRowContent = '<td>' + fret + '</td>';
        var toAppend = '.tab-bar tr.string-' + stringNumber;
        $(toAppend).append(newRowContent);
      }
    }
  });

  for (stringNumber = numStrings; stringNumber > 0; stringNumber--) {
    if(jQuery.inArray(stringNumber, updatedStrings) === -1) {
      newRowContent = '<td></td>';
      var toAppend = '.tab-bar tr.string-' + stringNumber;
      $(toAppend).append(newRowContent);
    }
  }
}


$(document).ready(function() {
  var dataArray = [];
  var data = $('.append-chord-icon').each(function() {
    dataArray.push([$(this).data('name'), $(this).data('notes')]);
  })
  $.each(dataArray, function(index, data) {
    var name = data[0];
    var notes = data[1].split('|');
    $.each(notes, function(index, note) {
      var note = note.split(',');
      var string = 'string-' + note[0];
      var fret = 'fret-' + note[1];
      var icon = '<i class="fa fa-circle"></i>'
      var colId = '#' + name + '-chord tr.' + fret + ' td.' + string
      $(colId).append(icon);
    });
  });
  $('#chord-picker').dialog({
    autoOpen: false,
    width: 350,
    height: 270,
    resizable: 'false',
    draggable: true
  })
  $('#chord-picker-button').click(function() {
    $('#chord-picker').dialog('open');
  });
  $('#chord-picker .nav-link').click(function() {
    event.preventDefault();
    var chordName = '#' + $(this).data('name') + '-chord'
    $('#chord-picker').animate({
        scrollTop: $(chordName).offset().top - 260
    }, 200);
  });
  $('#chord-picker .append-chord-icon').click(function() {
    event.preventDefault();
    $('#chord-picker').dialog('close');
    var notes = $(this).data('notes');
    var span = '<span>' + notes + '</span>'
    $('#snippet').html(span)
    appendChordContent();
  });
});
