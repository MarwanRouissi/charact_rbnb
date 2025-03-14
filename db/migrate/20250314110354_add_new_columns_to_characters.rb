class AddNewColumnsToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :larger_description, :string
    add_column :characters, :skill_1, :string
    add_column :characters, :skill_2, :string
    add_column :characters, :skill_3, :string
    add_column :characters, :loves_most_1, :string
    add_column :characters, :loves_most_2, :string
    add_column :characters, :loves_most_3, :string
    add_column :characters, :height, :float
    add_column :characters, :eye_color, :string
    add_column :characters, :best_friend, :string
    add_column :characters, :price_comment, :string
  end
end
