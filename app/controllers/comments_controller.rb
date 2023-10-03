class CommentsController < ApplicationController

  def create
    new_comment = Comment.new

    new_comment.author_id = params.fetch("input_author_id")
    new_comment.body = params.fetch("input_comment")
    new_comment.photo_id = params.fetch("input_photo_id")

    if new_comment.valid?
      new_comment.save
    end
    redirect_to("/photos/#{new_comment.photo_id}")
  end
  
end
