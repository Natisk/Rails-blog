function add_tag_form(){
    input = $(".field:last");
    name = input.attr('name');
    console.log(name);
    var number =  Number(name.replace(/\D+/g,""))+1;                                                    //выбираем число 3 из  post[tags_attributes][3][name] и добавляем 1
    cloned_input =  input.clone().val('').attr('name','post[tags_attributes]['+number+'][name]');
    $(input).after(cloned_input);
    console.log(number);
}

jQuery(function(){
    jQuery('.tags').tagcloud({centrex:100,centrey:100,min_font_size:10,max_font_size:16,zoom:100});

    var nextIndex = 2;

    jQuery(".add_tag").click(function() {
        var html = '<span> </span>';
        html += '<input type="text" name="post[tags_attributes]['+ nextIndex +'][tag_word]" class="add_tag" />'
        jQuery(".fields_tag").append(jQuery(html));
        nextIndex++;
    });

});