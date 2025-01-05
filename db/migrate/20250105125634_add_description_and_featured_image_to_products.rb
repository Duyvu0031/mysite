class AddDescriptionAndFeaturedImageToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :description, :string
    add_column :products, :featured_image, :string
  end
end
