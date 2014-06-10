$(function(){
  $("select#user_scores").chosen({
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
});