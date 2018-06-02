/* Cart */
$('body').on('click', '.add-to-cart-link', function(e) {
    e.preventDefault();
    var id = $(this).data('id'),
        qty = $('.quantity input').val() ? $('.quantity input').val() : 1;
    $.ajax({
        url: '/cart/add',
        data: {id: id, qty: qty,},
        type: 'GET',
        success: function(result) {
            showCart(result);
        },
        error: function() {
            alert('Error! Try again later.');
        }
    });
});

$('#cart .modal-body').on('click', '.del-item', function() {
    var id = $(this).data('id');
    $.ajax({
        url: '/cart/delete',
        data: {id: id},
        type: 'GET',
        success: function(result) {
            showCart(result);
        },
        error: function() {
            alert('Error!');
        }
    });
});

function showCart(cart) {
    if ($.trim(cart) == '<h3>Cart is empty</h3>') {
        $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css('display', 'none');
    } else {
        $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css('display', 'inline-block');
    }

    $('#cart .modal-body').html(cart);
    $('#cart').modal();
    if ($('.cart-sum').text()) {
        $('.header-cart-info').html($('#cart .cart-sum').text());
    } else {
        $('.header-cart-info').text('Empty Cart');
    }
}

function getCart() {
    $.ajax({
        url: '/cart/show',
        type: 'GET',
        success: function(result) {
            showCart(result);
        },
        error: function() {
            alert('Error! Try again later.');
        }
    });
}

function clearCart() {
    $.ajax({
        url: '/cart/clear',
        type: 'GET',
        success: function(result) {
            showCart(result);
        },
        error: function() {
            alert('Error! Try again later.');
        }
    });
    return false;
}


/* Currency */
$('#currency').change(function() {
    window.location = 'currency/change?curr=' + $(this).val();
    console.log($(this).val());
});

// $('.available select').on('change', function() {
//    var modId = $(this).val(),
//        color = $(this).find('option').filter(':selected').data('title'),
//        price = $(this).find('option').filter(':selected').data('price'),
//        basePrice = $('$base-price').data('base');
//    if (price) {
//        $('$base-price').text(symbolLeft + price + symbolRight);
//    } else {
//        $('$base-price').text(symbolLeft + basePrice + symbolRight);
//    }
// });