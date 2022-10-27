class AuthorsController < ApplicationController

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(params.require(:author).permit(:first_name, :last_name))
    @authors = Author.all
    render partial: "author_select", locals: { author: @author }
  end

end
