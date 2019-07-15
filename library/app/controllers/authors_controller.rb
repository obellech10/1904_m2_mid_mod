class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
    @average_pages = @author.average_pages
  end
end
