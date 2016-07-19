require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @all_recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
     @recipe = Recipe.find_by(:id => params[:id])
     if @recipe
       erb :recipe
     else
       erb :new_recipe
    end
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(:id => params[:id])
    @id = params[:id]
    erb :edit
  end

  post '/recipes' do
    recipe = Recipe.new
    params.each{|k, v| recipe.send("#{k.to_sym}=", v)}
    recipe.save
    redirect to "/recipes/#{recipe.id}"
  end

  patch "/recipes/:id" do
    recipe = Recipe.find(params[:id]).update(params)
    redirect to "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.delete
  end




end
