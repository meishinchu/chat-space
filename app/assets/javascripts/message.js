$(function(){
  function buildHTML(message){
    var html_image = ""
    if(message.image){
      html_image = `<img src="${message.image}" class ="chat-main__image">`
    }
    var html = `<div class ="chat-main__message" data-message-id="${message.id}">
                  <p class ="chat-main__message__member">
                    ${message.name}
                  </p>
                  <p class ="chat-main__message__day">
                    ${message.created_at}
                  </p>
                <div class ="chat-main__text">
                  <p class ="chat-main__text__word">
                    ${message.text}
                  </p>
                    ${html_image}`
    return html;
  }

  $('#new_message').on('submit', function(e){ 
    e.preventDefault(); 
    var formData = new FormData(this); 
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-main').append(html);
      $('.chat-form__input__text').val('');
      $('.chat-main').animate({scrollTop:$('.chat-main')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    })
  })

  $(function(){
    if ($('.chat-main__message').length) {
      setInterval(update, 5000);
    }
  });

  function update(){
    var message_id = $('.chat-main__message').last().data('message-id');
    $.ajax({
      url: location.href,
      type: 'GET',
      data: { id: message_id },
      dataType: 'json'
    })
    .done(function(data){
      data.forEach(function(message){
        var html = buildHTML(message);
        $('.chat-main').append(html);
      });
      $('.chat-main').animate({scrollTop:$('.chat-main')[0].scrollHeight});
    })
    .fail(function(){
      alert('自動更新に失敗しました');
    })
  }
});
