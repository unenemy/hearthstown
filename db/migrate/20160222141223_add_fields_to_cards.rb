class AddFieldsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :flavor, :string
    add_column :cards, :text, :string
  end
end
