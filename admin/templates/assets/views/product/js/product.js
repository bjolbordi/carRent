$(document).ready(function() {
    $('input[name=variants]').tagEditor({
        animateDelete:0,
        placeholder:'Combine attributes, e.g.: "Size: xl", "Color: red"',
        beforeTagDelete: function(field, editor, tags, val, id) {
            $('#check-' + id).trigger('click');
        }
    });
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
$(document).on('click', '[data-toggle="modal"]', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    if (url.indexOf('#') == 0) {
        $(url).modal('open');
    } else {
        $.get(url, function(data) {
            $('.modal').remove();
            $('<div class="modal fade">' + data + '</div>').modal(function () {
            });
            setTimeout(function () {
                $('.datetimepicker-3').datetimepicker({
                    widgetPositioning: {
                        horizontal: 'right'
                    },
                    format: 'YYYY-MM-DD HH:mm:ss',
                    defaultDate: '',
                    debug: false
                }).on('dp.change',function(event){
                   updateVariantSale();
                });
            }, 500)
        }).success(function() {

        });
    }
});
$(document).on('change', '.variant-image', function () {
    updateVariantImages($(this));
});

$(document).on('click', '.generate', function () {
    generateVariants($(this));
});

$(document).on('change', '.attr', function () {
    var e = $(this);
    var id = e.data('attr_value_id');
    if(e.is(':checked')){
        $('input[name=variants]').tagEditor('addTag', e.data('attr_title') + ':' + e.data('title'), true, id);
    }else{
        $('input[name=variants]').tagEditor('removeTag', e.data('attr_title') + ':' + e.data('title'), true, id);
    }
} );

var timer;
$(document).on('keyup', '.variant-tr input', function () {
    //clearTimeout(timer);
    var e = $(this);
    timer = setTimeout(function() {
        updateVariant(e);
    }, 2000);
} );
$(document).on('change', '.variant-tr input[type=radio]', function () {
    var e = $(this);
    updateVariant(e);
} );
$(document).on('keyup', 'input[name=variant_code],input[name=variant_sale],input[name=variant_sale_end_date]', function (event) {
    var e = event.currentTarget;
    if(e.delayTimer)
        clearTimeout(e.delayTimer);
    e.delayTimer = setTimeout(function() {
        updateVariantSale();
    }, 2000);
});
$(document).on('change', 'input[name=variant_sale_end_date]', function (event) {
    //clearTimeout(timer);
    var e = event.currentTarget;
    if(e.delayTimer)
        clearTimeout(e.delayTimer);
    e.delayTimer = setTimeout(function() {
        updateVariantSale();
    }, 2000);
});
$(document).on('keyup', '#attr-search', function () {
    var code = $(this).val();
    $(this).parents('.panel-collapse-in').find('.attr-label').hide();
    $(this).parents('.panel-collapse-in').find('.attr-label:contains("'+code+'")').show();
});
$(document).on('click', '#show-attr', function () {
    $(this).parents('.panel-collapse-in').find('.attr-label').show();
    $(this).hide();
});
function updateVariant(e) {
    var tr = e.parents('tr');
    var variant_id = tr.data('id');
    var product_id = tr.data('product_id');
    var price = tr.find('input[name=variant_price]').val();
    var sku = tr.find('input[name=variant_sku]').val();
    var quantity = tr.find('input[name=variant_quantity]').val();
    var def = tr.find('input[name=variant_default]:checked').val();

    $.ajax({
        url: ADMIN_URL + LANG + '/product/EditVariant/' + variant_id,
        type: 'POST',
        dataType: 'json',
        data: {
            price : price,
            sku : sku,
            quantity : quantity,
            default : def,
            product_id: product_id
        },
        success: function(data) {
            $.notify("Saved!", {type: 'success'});
        }
    });
}

function updateVariantSale() {
    var variant_id = $('input[name=variant_id]').val();
    var sale = $('input[name=variant_sale]').val();
    var code = $('input[name=variant_code]').val();
    var saleDate = $('input[name=variant_sale_end_date]').val();
    $.ajax({
        url: ADMIN_URL + LANG + '/product/EditVariant/' + variant_id,
        type: 'POST',
        dataType: 'json',
        data: {
            ajax : true,
            sale : sale,
            code : code,
            sale_end_date : saleDate
        },
        success: function(data) {
            $.notify("Saved!", {type: 'success'});
        }
    });
}

function updateVariantImages(e) {
    var photo_id = e.data('id');
    var variant_id = e.data('variant_id');
    var add = e.is(':checked') ? 1 : 0;
    $.ajax({
        url: ADMIN_URL + LANG + '/product/EditVariantImages/' + variant_id,
        type: 'POST',
        dataType: 'json',
        data: {
            photo_id : photo_id,
            variant_id : variant_id,
            add : add,
        },
        success: function(data) {
            $.notify("Saved!", {type: 'success'});
        }
    });
}

function generateVariants(e) {
    var product_id = e.data('product_id');
    var attr = $('input[name=variants]').val();
    if(!attr)
        return false;
    var arr = attr.split(",");
    $.ajax({
        url: ADMIN_URL + LANG + '/product/Generate/' + product_id,
        type: 'POST',
        dataType: 'json',
        data: {
            attr : attr,
        },
        success: function(data) {
            $.each(arr, function( key, value ) {
                var val = value.split("|")[1];
                $('input[name=variants]').tagEditor('removeTag', val, true);
            });
            getVariants(product_id);
        }
    });
}

function getVariants(id) {
    $.ajax({
        url: ADMIN_URL + LANG + '/product/GetVariants/' + id,
        type: 'POST',
        dataType: 'html',
        data: {},
        success: function(data) {
            $('#variants-table').html(data);
        }
    });
}
