function appendNoteToSnippet(dataNote) {
  var noteSpan = '<span>' + dataNote + '</span>';
  var noteLocker = $('#note-locker i');
  var snippet = $('#snippet');
  var snippetSpan = $('#snippet span');
  var spanText = snippetSpan.text();

  if (noteLocker.attr('class') === 'fa fa-lock' && snippet.html().length > 0) {
    snippetSpan.text(spanText + '|' + dataNote);
  } else {
    $('#snippet').empty();
    $('#snippet').append(noteSpan);
  }
}

function boardIsLocked() {
  var isLocked;
  if ($('#note-locker i').attr('class') === 'fa fa-lock') {
    return true;
  } else {
    return false;
  }
}

function buildTabBar() {
  $('#snippet span' ).each(function(index) {
    var note = $(this).text().split(',');
    var string = note[0];
    var fret = note[1];
    var numStrings = 6;
    var newRowContent;

    for (stringNumber = numStrings; stringNumber > 0; stringNumber--) {
      if (stringNumber === parseInt(string)) {
        newRowContent = '<td>' + fret + '</td>';
      } else {
        newRowContent = '<td></td>';
      }
      var toAppend = '.tab-bar tr.string-' + stringNumber;
      $(toAppend).last().append(newRowContent);
    }
  });
}

function toggleActiveNote(iconBox, note) {
  var noteString = note.split(',')[0];
  var stringClass = '#fret-board td.string-' + noteString + '.active';
  $(stringClass).toggleClass('active');
  iconBox.toggleClass('active');
}

function rebuildSnippet(note, iconBox) {
  $('#snippet').html('');
  $('#fret-board td.active i').each(function(index) {
    appendNoteToSnippet($(this).data('note'));
  });
}

function addNewTabBar() {
  var numCols = $('.tab-bar tr.string-1').last().children('td').length;
  if (numCols >= 20) {
    return true;
  } else {
    return false;
  }
}

$(document).ready(function() {
  var blankTabBar = $('.tab-bar').clone();
  $('.fa-music').click(function() {
    var icon = $(this);
    var iconBox = icon.closest('td');
    if (iconBox.hasClass('active') === false) {
      var note = icon.data('note');
      toggleActiveNote(iconBox, note);
      if (boardIsLocked() === false) {
        appendNoteToSnippet(note);
        buildTabBar();
        iconBox.toggleClass('active');
      } else {
        rebuildSnippet();
      }
    } else {
      iconBox.removeClass('active');
      rebuildSnippet();
    }

    if (addNewTabBar() === true) {
      $('#full-tab').append(blankTabBar);
      blankTabBar = blankTabBar.clone();
    }
  });
});
