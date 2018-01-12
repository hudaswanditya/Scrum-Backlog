document.addEventListener("turbolinks:load",function(){
    $('#stories').sortable({
      update: function(e, ui){
        $.ajax({
          url: "sort",
          type: "PATCH",
          data: $(this).sortable('serialize')
        });
      }
    });
});
