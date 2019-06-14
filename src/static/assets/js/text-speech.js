try {
    var SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    var recognition = new SpeechRecognition();
}
catch (e) {
    console.error(e);
    $('.no-browser-support').show();
    $('.app').hide();
}

var noteTextarea = $('#note-textarea');
var instructions = $('#recording-instructions');
var notesList = $('ul#notes');

var noteContent = '';

// Get all notes from previous sessions and display them.
var notes = getAllNotes();
renderNotes(notes);



/*-----------------------------
      Voice Recognition 
------------------------------*/

// If false, the recording will stop after a few seconds of silence.
// When true, the silence period is longer (about 15 seconds),
// allowing us to keep recording even when the user pauses. 
recognition.continuous = true;

// This block is called every time the Speech APi captures a line. 
recognition.onresult = function (event) {

    // event is a SpeechRecognitionEvent object.
    // It holds all the lines we have captured so far. 
    // We only need the current one.
    var current = event.resultIndex;

    // Get a transcript of what was said.
    var transcript = event.results[current][0].transcript;

    // Add the current transcript to the contents of our Note.
    // There is a weird bug on mobile, where everything is repeated twice.
    // There is no official solution so far so we have to handle an edge case.
    var mobileRepeatBug = (current == 1 && transcript == event.results[0][0].transcript);

    if (!mobileRepeatBug) {
        noteContent += transcript;
        noteTextarea.val(noteContent);
    }

    $.ajax({
            url: 'http://127.0.0.1:5000/pergunta',
            data: {pergunta: $("textarea[name=pergunta]").val()},
            type: 'POST',
            success: function(response) {
                botResponse = JSON.parse(response).text;
                readOutLoud(botResponse);
                saveNote(new Date().toLocaleString(),$("textarea[name=pergunta]").val(), botResponse);
                renderNotes(getAllNotes());
            },
            error: function(error) {
                console.log(error);
            }
        });
        document.getElementById('start-record-btn').style.backgroundColor = "transparent";
        recognition.stop();
};

recognition.onstart = function () {
    instructions.text('Reconhecimento de voz ativado, converse comigo.');
}

recognition.onspeechend = function () {
    document.getElementById('start-record-btn').style.backgroundColor = "transparent";
    recognition.stop();
}

recognition.onerror = function (event) {
    if (event.error == 'no-speech') {
        readOutLoud("Não detectei nenhuma fala. Tente novamente.");
    };
}



/*-----------------------------
      App buttons and input 
------------------------------*/
$('#start-record-btn').on('click', function (e) {
    document.getElementById('start-record-btn').style.backgroundColor = "red";
    if (noteContent.length) {
        noteContent += ' ';
    }
    recognition.start();
    document.getElementById('note-textarea').value='';
    noteContent = '';
});


//$('#pause-record-btn').on('click', function (e) {
//    recognition.stop();
//    instructions.text('Reconhecimento de voz pausado.');
//});

// Sync the text inside the text area with the noteContent variable.
noteTextarea.on('input', function () {
    noteContent = $(this).val();
})

//$('#save-note-btn').on('click', function (e) {
//    recognition.stop();
//
//    if (!noteContent.length) {
//        instructions.text('Você não falou e nem escreveu nada.');
//    }
//    else {
//        noteContent = '';
//        instructions.text('Enviado com sucesso.');
//    }
//
//})


notesList.on('click', function (e) {
    e.preventDefault();
    var target = $(e.target);

    // Listen to the selected note.
    if (target.hasClass('listen-note')) {
        var content = target.closest('.note').find('.content').text();
        readOutLoud(content);
    }

    // Delete note.
    if (target.hasClass('delete-note')) {
        var dateTime = target.siblings('.date').text();
        deleteNote(dateTime);
        target.closest('.note').remove();
    }
});



/*-----------------------------
      Speech Synthesis 
------------------------------*/

function readOutLoud(message) {
    var speech = new SpeechSynthesisUtterance();

    // Set the text and voice attributes.
    speech.text = message;
    speech.volume = 1;
    speech.rate = 1.4;
    speech.pitch = 1;
    speech.lang = 'pt-BR';

    window.speechSynthesis.speak(speech);
}

function faleMielina(fala) {
    var speech = new SpeechSynthesisUtterance();

    // Set the text and voice attributes.
    speech.text = fala;
    speech.volume = 1;
    speech.rate = 1.4;
    speech.pitch = 1;
    speech.lang = 'pt-BR';

    window.speechSynthesis.speak(speech);
}



/*-----------------------------
      Helper Functions 
------------------------------*/

function renderNotes(notes) {
    var html = '';
    if (notes.length) {
        notes.forEach(function (note) {
            html += `
            <div class="msgContainer note">
                <i class="fas fa-user"></i>
                <p class="content">${note.content}</p>
                <span class="time-right date">${note.date}</span>
                <a href="#" class="listen-note" title="Listen to Note">Listen to Note</a>
                <a href="#" class="delete-note" title="Delete">Delete</a>
            </div>
            <div class="msgContainer note darker">
                <i class="fas fa-robot right"></i>
                <p class="content">${note.response}</p>
                <span class="time-left date">${note.date}</span>
                <a href="#" class="listen-note" title="Listen to Note">Listen to Note</a>
                <a href="#" class="delete-note" title="Delete">Delete</a>
            </div>`;
        });
    }
    else {
        html = '<div><p class="content">Você ainda não conversou comigo.</p></div>';
    }
    notesList.html(html);
}


function saveNote(dateTime, content, response) {
    var teste = {
        dateTime,
        content,response
    }
    localStorage.setItem('note-' + dateTime, JSON.stringify(teste));
}


function getAllNotes() {
    var notes = [];
    var key;
    for (var i = 0; i < localStorage.length; i++) {
        key = localStorage.key(i);
        if (key.substring(0, 5) == 'note-') {
        var content = JSON.parse(localStorage.getItem(localStorage.key(i)))
            notes.push({
                date: key.replace('note-', ''),
                content: content.content,
                response: content.response
            });
        }
    }
    return notes.reverse();
}


function deleteNote(dateTime) {
    localStorage.removeItem('note-' + dateTime);
}



$( document ).ready(function() {
    faleMielina("Olá meu nome é Mielina, a assistente pessoal da Universidade Positivo, estou aqui para ajudá-lo");
});
