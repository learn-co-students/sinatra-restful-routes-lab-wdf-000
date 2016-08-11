class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    @delete_message = "#{@recipe[:name]} was deleted"
    @recipe = Recipe.all
    erb :index
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(params[:recipe])
    @recipe.save
    erb :show
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params[:recipe])
    redirect 'recipes'
  end


end