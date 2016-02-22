class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :title
      t.string :avatar_url
      t.string :code

      t.timestamps null: false
    end
  end
end
