class TweetsController < ApplicationController

  get '/tweets' do
    redirect to '/login' if !logged_in?
    @user = current_user
    @tweets = Tweet.all
    erb :'tweets/index'
  end

  get '/tweets/new' do
    redirect to '/login' if !logged_in?
    erb :'tweets/new'
  end

  post '/tweets' do
    if !params[:content].empty?
      user = current_user
      Tweet.create(user_id: user.id, content: params[:content])
      redirect to '/tweets'
    else
      redirect to '/tweets/new'
    end
  end
end
