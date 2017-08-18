$(document).ready(function(){
    var form = $("#expense_index_id");
    form.validate({
        rules: {
            user_suffix: {
                required: true
            },
            company_suffix: {
                required: true
            }

        }
    });
    form.children("div").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        onStepChanging: function (event, currentIndex, newIndex)
        {
            form.validate().settings.ignore = ":disabled,:hidden";
            return form.valid();
        },
        onFinishing: function (event, currentIndex)
        {
            form.validate().settings.ignore = ":disabled";
            return form.valid();
        },
        onFinished: function (event, currentIndex)
        {
            form.submit();
        }
    });
});

