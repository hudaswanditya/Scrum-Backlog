//repo: th30r3tisch/tablegamesite
document.addEventListener("turbolinks:load",function(){
    $('#stories').sortable({
      update: function(e, ui){
        $.ajax({
          url: "/sort",
          type: "get",
          data: $(this).sortable('serialize')
        });
      }
    });
});
