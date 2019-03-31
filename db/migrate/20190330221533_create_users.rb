class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, default: "", null: false
      t.string :email, default: "", null: false
      t.string :image, default: ""
      t.boolean :is_enabled, default: true, null: false
      t.string :password_digest, default: "", null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
