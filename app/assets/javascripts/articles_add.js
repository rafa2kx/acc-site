var img_count = 1;
var items_count = {};
$("#add_ingredient").on("click", add_item)
$("#add_step").on("click", add_item)
$("#add_image").on("click", function(){

    new_img_input = $("#image_0").clone();
    $(new_img_input).attr("id", "image_"+img_count);
    $(new_img_input).children("input").attr("id", "image_input_"+img_count);
    $(new_img_input).children("input").attr("name", "image["+img_count+"][content]");
    $(new_img_input).children("input").val("");
    $(new_img_input).children("input").on("change", onFileLoad);

    $(new_img_input).find("img").attr("id", "image-loader_"+img_count);
    $(new_img_input).find("img").attr("src", "");
    $(new_img_input).find("img").attr("alt", "");

    $(new_img_input).find(".rem_image").on("click",function(){
        $(this.parentElement.parentElement).remove();
    })

    $(".images-inputs").append(new_img_input);
    img_count++;

})
$(".rem_image").on("click",function(){
    $(this.parentElement.parentElement).remove();
})
$(".file-upload").on("change", onFileLoad);

function onFileLoad(){
    $("#add_image").css({display:"inline"})
    $(this).siblings('div').children('img').css({display:"inline"});
    if(this.id != "image_input_0")
        $(this).siblings('div').children('.rem_image').css({display:"inline"});
    var preview = $(this).siblings('div').children('img')[0];
    var file  = $(this)[0].files[0];
    var reader  = new FileReader();
    reader.onloadend = function () {
        preview.src = reader.result;
    }
    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
    }
}
function add_item() {
    item_name = $(this).attr('id').split('_')[1]
    if (items_count[item_name] == null)
        items_count[item_name] = 0;

    if ($("#"+ item_name +"_value").val() != "") {
        var value = $("#"+ item_name +"_value").val();
        var item = document.createElement('div');
        $(item).attr('class', 'btn btn-info item');
        $(item).append(value);

        var rem_item = document.createElement('span');
        $(rem_item).append('<span class="glyphicon glyphicon-remove"></span>');
        $(rem_item).attr('class','btn');
        $(rem_item).css({fontWeight: "bold",marginLeft: "7px",padding: "0px 3px"});
        $(rem_item).on('click',function(){
            $(this.parentElement).remove();
        });
        $(item).append(rem_item);
        var item_input = document.createElement('input');
        $(item_input).attr('type','hidden');
        $(item_input).attr('name','article['+item_name+'s]['+items_count[item_name]+'][name]');
        $(item_input).attr('value',value);
        items_count[item_name]++;
        $(item).append(item_input);
        $("."+item_name+"s").append(item);
        $("#"+ item_name +"_value").val("")
    }
}

