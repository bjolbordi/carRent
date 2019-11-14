$(document).ready(function() {
    var tags = $('#tags').val();
    var allTags = $('#all-tags').val();
    var tagsArray = [];
    var allTagsArray = [];
    if(tags){
        tagsArray = tags.split(',')
    }
    if(allTags){
        allTagsArray = tags.split(',')
    }
    $('input[name=tags]').tagEditor({
        animateDelete:0,
        placeholder:'Tags e.g.: "Women", "Perfume" , "Some"',
        initialTags: tagsArray,
        autocomplete: {
            minLength: 0,
            lookup: allTagsArray
        },
        beforeTagDelete: function(field, editor, tags, val, id) {

        }
    });

});