
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do #! Setup all articles for the index page
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do #! New page setup so .new is needed on the class
    @article = Article.new
    erb :new
  end
  
  post '/articles' do #! Use .create to make the new article from the forms to the DB. Setup redirect to each ID.
  @article = Article.create(params)
  # binding.pry
  redirect "/articles/#{@article.id}"
  end


  get "/articles/:id" do #! Setup the ID pages and display the page. For the specific ID by inserting it into the HTML page.
    @article = Article.find(params[:id])
    erb :show
  end

  get "/articles/:id/edit" do #! Same as above
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do #! Find the ID, use .update with the params and redirect to the ID page you want to edit.
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end


  delete "/articles/:id" do #! Delete works like above. But use the ID to destroy the Article.
    Article.destroy(params[:id])
    redirect "/articles"
  end

end

# rake db:migrate SINATRA_ENV=test

