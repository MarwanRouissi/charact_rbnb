class AddColumnsToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :wtf_phrase, :string
    add_column :characters, :price, :float
    add_column :characters, :activity, :string
    add_column :characters, :url_image, :string
  end
end
