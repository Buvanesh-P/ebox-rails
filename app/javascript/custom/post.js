$('body').on('click','.like-action', function(e){
    var postId = $(this).data('id');
     $.ajax({
         url: "/ajaxlikes",
         type: "post",
         data: {
             post_id : postId
             },
         dataType: "json",
         success: function(data) {
           if(data.status=="created"){
             $("#like_button_"+data.post_id).removeClass('fa-regular')
             $("#like_button_"+data.post_id).addClass('fa-solid')
             $(".like_list_"+data.post_id).html(data.like_list)
           }else{
             $("#like_button_"+data.post_id).removeClass('fa-solid')
             $("#like_button_"+data.post_id).addClass('fa-regular')
             $(".like_list_"+data.post_id).html(data.like_list)
           }
         },
         error: function(data) {
 
         }
     })
 })

 $('body').on('click','.share-icon', function () {
    var share_url = $(this).data('url')
    $('.facebook-icon').attr("href","https://www.facebook.com/sharer/sharer.php?u="+share_url+"")
    $('.twitter-icon').attr("href","https://twitter.com/intent/tweet?text="+share_url+"")
    $('.linkedin-icon').attr("href","https://www.linkedin.com/shareArticle?mini=true&url="+share_url+"&title=&summary=&source=")
    $("#exampleModal").modal('show');
  })