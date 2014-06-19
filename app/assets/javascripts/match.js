$(function(){
  $("select#user_scores, select.betting-multi-score").chosen({
    max_selected_options: 3,
    no_results_text: "Oops, nothing found!"
  });

  $("select#score_id").change(function(){
    var score_id = $(this).val();
    $.ajax({
      url: "/scores/" + score_id + "/get_score",
      type: "POST",
      dataType: "json",
      success: function(response){
        if(response.is_draw){
          $("input[name='result']").last().prop("checked", true);
        }else{
          $("input[name='result']").first().prop("checked", true);
        }
      }
    });
  });
  $("table.list-people-betting tbody").readmore({
    speed: 90,
    maxHeight: 200,
    moreLink: '<a href="#" class="green-btn">Xem tất cả</a>',
    lessLink: '<a href="#" class="green-btn">Thu gọn</a>',
    embedCSS: true
  });
});