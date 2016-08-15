class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Should display all recipes
  get '/' do
    redirect to '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # Display form for creating a new recipe
  get '/recipes/new' do
    erb :new
  end

  # Create new recipe with info from /recipes/new page
  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect to 'recipes/:id'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

  # Delete action
  delete '/recipes/:id/delete' do
    binding.pry
    @recipe = Recipe.find_by(params[:id])
    @recipe.delete
    redirect to '/'
  end

end

# class ApplicationController < Sinatra::Base
#   configure do
#     set :public_folder, 'public'
#     set :views, 'app/views'
#   end
#
#   get '/' do
#    # erb :index
#     redirect '/recipes'
#   end
#
#   get '/recipes' do
#     @recipes = Recipe.all
#     erb :index
#   end
#
#   get '/recipes/new' do
#     erb :new
#   end
#
#   get '/recipes/:id' do
#     @recipe = Recipe.find(params[:id])
#     erb :show
#   end
#
#   post '/recipes' do
#     recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
#     redirect "/recipes/#{recipe.id}"
#   end
#
#   get '/recipes/:id/edit' do
#     @recipe = Recipe.find(params[:id])
#     erb :edit
#   end
#
#   patch '/recipes/:id/edit' do
#     recipe = Recipe.find(params[:id])
#     recipe.update(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
#     redirect "/recipes/#{recipe.id}"
#   end
#
#   delete '/recipes/:id/delete' do
#     recipe = Recipe.find(params[:id])
#     recipe.delete
#     redirect '/'
#   end
# end
