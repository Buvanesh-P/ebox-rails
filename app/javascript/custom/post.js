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