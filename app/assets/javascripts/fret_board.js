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

function getFretClicker(stringNumber, fretNumber) {
  var iconClass = 'fa fa-music';
  clicker = '<i class="' + iconClass + '" data-note="' + stringNumber + ',' + fretNumber + '"></i>'
  return clicker;
}

function generateFretBoard() {
  var fretNumber = 0;
  var newRowContent;
  var numFrets = 27;
  var numStrings = 6;
  var stringNumber;

  for (fretNumber; fretNumber <= numFrets; fretNumber++) {
    newRowContent = '<tr class="fret-' + fretNumber + '">';
    for (stringNumber = numStrings; stringNumber >= 0; stringNumber--) {
      currentString = stringNumber + 1;
      if (stringNumber === numStrings) {
        newRowContent += '<th scope="row">' + fretNumber + '</th>'
      } else {
        newRowContent += '<td class="string-' + currentString  + '">' + getFretClicker(currentString, fretNumber) + '</td>';
      }
    }
    newRowContent += '</tr>'
    $("#fret-board tbody").append(newRowContent);
  }
}

function toggleLockIcon(lockIcon) {
  if (lockIcon.attr('class') === 'fa fa-unlock') {
    lockIcon.removeClass();
    lockIcon.addClass('fa fa-lock');
    $('#snippet').empty();
  } else {
    if (!$('#snippet span').is(':empty')) {
      appendChordContent();
    }
    lockIcon.removeClass();
    lockIcon.addClass('fa fa-unlock');
    $('#fret-board td.active').toggleClass('active');
  }
}

$(document).ready(function() {
  generateFretBoard();
  $('#note-locker i').click(function() {
    toggleLockIcon($(this));
  });
});
