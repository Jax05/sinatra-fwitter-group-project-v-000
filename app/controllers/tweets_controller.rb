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
      Tweet.create(user: current_user, content: params[:content])
      redirect to '/tweets'
    else
      redirect to '/tweets/new'
    end
  end

  get '/tweets/:id/edit' do
    redirect to '/login' if !logged_in?
    @tweet = Tweet.find(params[:id])
    erb :'tweets/edit'
  end

  get '/tweets/:id' do
    redirect to '/login' if !logged_in?
    @tweet = Tweet.find(params[:id])
    erb :'tweets/show'
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    if !params[:content].empty?
      @tweet.update(content: params[:content])
      redirect to "/tweets/#{@tweet.id}"
    else
      redirect to "/tweets/#{@tweet.id}/edit"
    end
  end
end
