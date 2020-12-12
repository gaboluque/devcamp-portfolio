jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')
  blog_id = comments.data("blog-id")

  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "BlogsChannel",
      blog_id: blog_id
    },
      connected: ->
      disconnected: ->
      recieved: (data) ->
        comments.append data['comment']
      send_comment: (comment, blog_id) ->
        @perform 'send_comment', comment: comment, blog_id: blog_id

  $('#new_comment').submit (e) ->
    $this = $(this)
    textArea = $this.find('#comment_content')
    textAreaVal = textArea.val()

    if $.trim(textAreaVal).length > 1
      App.global_chat.send_comment(textAreaVal, blog_id)
      textArea.val("")

    e.preventDefault()
    return false
