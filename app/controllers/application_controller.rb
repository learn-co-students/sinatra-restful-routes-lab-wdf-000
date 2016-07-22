require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    @all = Recipe.all
    erb :index
  end
  get '/recipes/new' do 
    erb :new
  end
  post '/recipes' do
    @tmp = Recipe.create(name:params[:name],ingredients:params[:ingredients],cook_time:params[:cook_time])
    redirect "/recipes/#{@tmp.id}"
  end

  get '/recipes' do
    @all = Recipe.all
    erb :index
  end
  get '/recipes/:id' do
    @recipe = Recipe.find_by(id:params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do
    Recipe.find_by(id:params[:id]).destroy
    redirect '/'
  end
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id:params[:id])
    erb :edit
  end
  patch '/recipes/:id' do
    @tmp = Recipe.find_by(id:params[:id]).update(name:params[:name],ingredients:params[:ingredients],cook_time:params[:cook_time])
    redirect "/recipes/#{@tmp.id}"
  end
end
