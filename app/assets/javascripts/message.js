$(function(){
  function buildHTML(message){
    var html_image = ""
    if(message.image){
      html_image = `<img src="${message.image}" class ="chat-main__image">`
    }
    var html = `<div class ="chat-main__message">
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
      console.log(html);
      $('.chat-main').append(html);
      $('.chat-form__input__text').val('');
      $('.chat-main').animate({scrollTop:$('.chat-main')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    })
  })
 });
