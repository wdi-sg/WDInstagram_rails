//= require rails-ujs
//= require jquery

$(document).ready(function() {
    console.log("ready!");
    const key = $('.temp_information').data('temp')
    $('#gif-randomizer').hide()
    $('#random-button').hide()
    $("#gifCheck").click(function() {
        if ($("#gifCheck").prop('checked')) {
            $('#photo-input').val("#").hide();
            $('.gif-randomizer').show();
            $('#random-button').show()


        } else {
            $('#photo-input').val("").show();
            $('#gif-randomizer').hide();
            $('#random-button').hide()

        }
    });
    $('#random-button').click(function() {
        $.ajax({
            url: `http://api.giphy.com/v1/gifs/random?api_key=${key}`,
            type: 'GET',
            dataType: 'json',

            success: function(data, textStatus, xhr) {
                $('.gif-randomizer').attr('src',data.data.image_url)
                $('#photo-input').val(data.data.image_url)
            },
            error: function(xhr, textStatus, errorThrown) {
                console.log('Error in Database');
            }
        })
    })

});