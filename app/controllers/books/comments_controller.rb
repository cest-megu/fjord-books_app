# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
    @book = @commentable
    @show_template = 'books/show'
  end
end
