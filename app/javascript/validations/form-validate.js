$('form').submit(function(){
    var requiredArr = []
    $('.generated-error').remove() 
    $('.required').each(function(event){
        if($(this).val()=='')
        {
            $('<div class="generated-error">This field is required</div>').insertAfter(this)
            requiredArr.push('false')
        }
    })
    if(requiredArr.includes('false'))
    {
        return false
    }
})

