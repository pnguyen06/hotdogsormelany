class PagesController < ApplicationController
  def home
  end

  def about
  end

  def data
  	@user = User.all
    @bolt = Bolt.all
  end
end
