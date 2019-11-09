class HomeController < ApplicationController
  def top
  end

  def about
  end

  def index
    @users = User.all
  end

  def user_change
    @user = User.find(params[:id])
  end

  def change
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.payment = params[:payment]
    @user.stripe_id = params[:stripe_id]
    @user.stripe_email = params[:stripe_email]
    @user.subscription_id = params[:subscription_id]
    @user.admin = params[:admin]
    @user.save
    redirect_to "/home/index"
  end


end
