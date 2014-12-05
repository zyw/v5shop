class UsersController < ApplicationController
  layout false,:only => ['login','logout']
  def login
  end

  def logout
  end
end