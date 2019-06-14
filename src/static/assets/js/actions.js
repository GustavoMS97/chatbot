$(function() {
    $('#botaoInteligencia').click(function() {
        $.ajax({
            url: 'http://127.0.0.1:5000/curso',
            data: {curso: 1},
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    $('#botaoAnalise').click(function() {
        $.ajax({
            url: 'http://127.0.0.1:5000/curso',
            data: {curso: 2},
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    $('#botaoJogos').click(function() {
        $.ajax({
            url: 'http://127.0.0.1:5000/curso',
            data: {curso: 3},
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    $('#botaoSoftware').click(function() {
        $.ajax({
            url: 'http://127.0.0.1:5000/curso',
            data: {curso: 4},
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    $('#botaoSistemas').click(function() {
        $.ajax({
            url: 'http://127.0.0.1:5000/curso',
            data: {curso: 5},
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    $('#botaoComputacao').click(function() {
        $.ajax({
            url: 'http://127.0.0.1:5000/curso',
            data: {curso: 6},
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    $('#botaoCiencia').click(function() {
        $.ajax({
            url: 'http://127.0.0.1:5000/curso',
            data: {curso: 7},
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

//     $('#save-note-btn').click(function() {
//        $.ajax({
//            url: 'http://127.0.0.1:5000/pergunta',
//            data: {pergunta: $("textarea[name=pergunta]").val()},
//            type: 'POST',
//            success: function(response) {
//                botResponse = JSON.parse(response).text;
//                readOutLoud(botResponse);
//                saveNote(new Date().toLocaleString(),$("textarea[name=pergunta]").val(), botResponse);
//                renderNotes(getAllNotes());
//            },
//            error: function(error) {
//                console.log(error);
//            }
//        });
//    });
});