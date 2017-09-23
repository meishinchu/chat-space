$(function() {
  function appendHTML(user){
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>`
    $("#user-search-result").append(html);
  }

  function appendHTMLuser(user){
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-$(user).data("user-id")'>
                  <input name='group[user_ids][]' type='hidden' value='$(user).data("user-id")'>
                  <p class='chat-group-user__name'>${$(user).data("user-name")}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    $("#chat-group-users").append(html);
  }

  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();

    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          appendHTML(user);
        });
      }
    })
    .fail(function(){
      alert('ユーザー検索に失敗しました');
    })
  });

  $(document).on("click", '.user-search-add', function() {
    $(this).parent().remove();
    appendHTMLuser(this);
  });
});
