
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    erb :index
  end

  post '/articles' do
    Article.create(params)
    redirect '/articles'
  end


    get '/articles/:id/edit' do
      @article = Article.find_by_id(params[:id])
      erb :edit
    end

  get '/articles/:id' do
    binding.pry
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/' do
  end
end
