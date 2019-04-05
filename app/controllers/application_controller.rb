require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
    erb :welcome
  end

  #new
  get '/articles/new' do
    erb :new
  end

  #create
  post '/articles/new' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  #SHOW
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #INDEX
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #EDIT
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #UPDATE
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end

  #DELETE
  delete '/articles/:id' do
    Article.destroy(params[:id])

    redirect "/articles"
  end

end
