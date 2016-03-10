class CreateTierlists < ActiveRecord::Migration
  def change
    create_table :tierlists do |t|
      t.integer :user_id
      t.index :user_id
      t.string :title
      t.text :description
      t.integer :score

      t.timestamps null: false
    end
  end
end
