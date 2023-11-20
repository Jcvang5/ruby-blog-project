$(function() {
    // alert('jQuery is working!');
    $('#comment-body').on('input', function(){
        console.log (gkdkgnlngkr)
        const value =$(this).value().trim();
        const submitButton =$(this).closest('form').find('input[type="submit"]')

        if(value === ''){
            $(this).css('border-color', 'red');
            submitButton.prop('disabled', true);
        } else {
            $(this).css('border-color', '');
            submitButton.prop('disabled', false);
        }
    });
    $('#load-comments').on('click',function(){
        const url = '/categories/1/articles/1/comments';
        console.log($.getJSON(url));
        $.getJSON(url, function(data){
            console.log(data);
    })
    })
});