$("a[data-method='delete']").on("ajax:success",function(){

});
$("a[data-method='delete']").on("click",function(){
    var self = this;
    $("#remove_msg button.submit").on("click", function(){
        alert(self);

    });
});
$("#remove_msg").on('show.bs.modal', function (e) {
    var trigger = $(e.relatedTarget);
    id = trigger.attr('data-value');
    $("#remove_msg a.submit").attr('href','/admin/'+ id +'/remove');

    $("#remove_msg a.submit").on("ajax:success",function(){
        $('#remove_msg').modal('hide');
        trigger.parents('tr').fadeOut('slow',function(){
            this.remove();
        });
        showAlert('success', 'Elemento eliminado satisfactoriamente.')
    });

    $("#remove_msg a.submit").on("ajax:error",function(){
        $('#remove_msg').modal('hide');

        showAlert('error', 'Ha ocurrido un error.')
    });


});