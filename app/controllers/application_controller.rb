
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id].to_i)
    erb :show
  end

  patch '/articles/:id' do
    article = Article.find_by(id: params[:id].to_i)
    article.title = params[:title]
    article.content = params[:content]
    article.save

    redirect "/articles/#{article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id].to_i)
    erb :edit
  end

  delete '/articles/:id' do
    article = Article.find_by(id: params[:id].to_i)
    article.destroy
    redirect "/articles"
  end

end
