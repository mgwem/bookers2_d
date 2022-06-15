class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    @search = params[:search]
    if @range == "User"
      @users = User.looks(@search, @word)
    elsif @range == "Book"
      @books = Book.looks(@search, @word)
    else
      @tags = Tag.looks(@search, @word)
    end
  end

end
