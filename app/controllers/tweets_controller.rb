class TweetsController < ApplicationController

  get '/tweets' do
    redirect to '/login' if !logged_in?
    @tweets = Tweet.all
    erb :'tweets/index'
  end

  get '/tweets/new' do
    redirect to '/login' if !logged_in?
    erb :'tweets/new'
  end

  post '/tweets' do
    if !params[:content].empty?
      tweet = Tweet.new(user_id: current_user.id, content: params["content"])
      redirect to '/tweets'
    else
      redirect to '/tweets/new'
    end
  end
end
