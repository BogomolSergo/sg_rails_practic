class UsersController < ApplicationController
  # before_filter :check_auth #перенесли в аппконтролер
  #skip_after_filter :check_auth, only: [:index] #скип для индекс
  #before_filter :user, only: [:show, :edit, :update, :destroy]
  def index
    order = params[:order] || 'asc'
    @users = User.order("id #{order}")
  end

  private

  def check_auth
    puts 'Check authorization!!!'
  end

  def user
    @user ||= User.find()
  end
end
