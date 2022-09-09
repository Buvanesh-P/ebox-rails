console.log('validate-js loading')
function required() {                        //For checking required fields
    let requiredArr = []
    $('.required').each(function (event) {
        if ($(this).val() == '') {
            $('<div class="generated-error">This field is required</div>').insertAfter(this)
            requiredArr.push('false')
        }
    })

    return requiredArr

}

function requiredRichText() {               //For checking required rich text field
    let requiredRichTextArr = []
    $('.required-rich-text').each(function (event) {
        if ($(this).empty()) {
            $('<div class="generated-error">This field is required</div>').insertAfter(this)
            requiredRichTextArr.push('false')
        }
    })
    return requiredRichTextArr
}

function alphaValidation()
{
    let alphaArr = []
    var alphaRegx = /^[a-zA-Z ]*$/;
    $('.alpha-only').each(function(event){
        if(!$(this).val().match(alphaRegx))
        {
            $('<div class="generated-error">Please enter aplhabets and space characters</div>').insertAfter(this)
            alphaArr.push('false')
        }
    })
    return alphaArr
}

function numberValidation()
{
    let numberArr = []
    var numberRegx = /^[0-9]*$/;
    $('.number-only').each(function(event){
        if(!$(this).val().match(numberRegx))
        {
            $('<div class="generated-error">Please enter numbers only</div>').insertAfter(this)
            numberArr.push('false')
        }
    })
    return numberArr
}

// Main 

$('form').submit(function () {
    if ($('.generated-error').length > 0) {
        $('.generated-error').remove()
    }

    var requiredVar, richTextVar, alphaVar, numberVar

    if ($('.required').length > 0) {
        requiredVar = required()
    }

    if ($('.required-rich-text').length > 0) {
        richTextVar = requiredRichText()
    }

    if($('.alpha-only').length > 0){
        alphaVar = alphaValidation()
    }

    if($('.number-only').length > 0){
        numberVar = numberValidation()
    }

    if ((richTextVar?.includes('false')) || (requiredVar?.includes('false')) || (alphaVar?.includes('false')) || (numberVar?.includes('false'))) {
        return false
    }

})