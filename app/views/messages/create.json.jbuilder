  json.text  @message.text
  json.image  @message.image.thumb.url
  json.name  @message.user.name
  json.created_at  @message.created_at.in_time_zone('Tokyo').to_s(:ymd)
