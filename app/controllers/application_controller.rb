class ApplicationController < Sinatra::Base #get and post methods we use are the sinatra base format


  configure do
    set :public_folder, 'public'   #finds your files
    set :views, 'app/views'
  end


  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipe
  end

  get '/recipes/new' do
    erb :new
  end


  post '/recipes' do
    @new_recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect "/recipes/#{@new_recipe.id}"
  end

  get '/recipes/:id' do
    @each_recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @edit_item = Recipe.find(params[:id])
    erb :edit
  end

  # get '/recipes/:id/update' do
  #   @updating_recipe = Recipe.find_by(params[:id])
  #   redirect "/recipes/#{@updating_recipe.id}/edit"
  # end





  delete '/recipes/:id/delete' do
    @delete_item = Recipe.find(params[:id])
    @delete_item.delete
  end



  patch "/recipes/:id" do
    @edited_recipe = Recipe.find(params[:id])
    @edited_recipe.name = params[:name]
    @edited_recipe.ingredients = params[:ingredients]
    @edited_recipe.cook_time = params[:cook_time]
    @edited_recipe.save
    redirect "/recipes/#{@edited_recipe.id}"
  end




end
