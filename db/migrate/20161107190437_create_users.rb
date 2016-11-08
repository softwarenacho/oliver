class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :admin
      t.string :email
      t.string :photo
      t.string :password_digest
      t.string :username

      t.timestamps null: false
    end
  end
end
