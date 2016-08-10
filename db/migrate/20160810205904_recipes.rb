class Recipes < ActiveRecord::Migration
  def change
    create_table :recipes do |col|
      col.string :name
      col.text :ingredients
      col.time :cook_time
    end
  end
end
