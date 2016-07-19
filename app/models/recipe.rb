class Recipe < ActiveRecord::Base

  def update(hash)
    self.name = hash[:name]
    self.content = hash[:content]
    self.save
  end
  
end
