$(function() {
    // alert('jQuery is working!');
    $('#comment-body').on('input', function(){
        const value =$(this).val().trim();
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
        const categoryId = $('#category-id').data('category');
        const articleId = $('#load-comments').data('article');

        const url = `/categories/${categoryId}/articles/${articleId}/comments`;
        console.log($.getJSON(url));
        
        $('#comment-section').empty();

        $.getJSON(url)
            .done(function(data) {
                const commentsContainer = $('#comment-section');
                data.forEach(function(comments) {
                    commentsContainer.append('<div class="comment-section">' + comments.body + '</div>');
                });
            })
            .fail(function(error) {
                alert('Error loading comments. Please try again later.');
            });
    });
});
$('#like-button').on('click', function() {
    $(this).toggleClass('liked');
    let likeCount = parseInt($(this).data('likes')) || 0;
    likeCount += $(this).hasClass('liked') ? 1 : -1;
    $(this).data('likes', likeCount);
    $(this).find('.like-count').text(likeCount);
});
