class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :password_hash
      t.string :password_salt
      t.string :token

      t.timestamps null: false
    end
  end
end
