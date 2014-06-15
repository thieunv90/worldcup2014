$(function(){
  $(".statistics-table tbody tr, .statistics-user-detail-table tbody tr").click(function(){
    var url = $(this).attr("data-url");
    window.location.href = url;
  });
});