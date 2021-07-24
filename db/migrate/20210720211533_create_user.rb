class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :name
      t.boolean :validated, default: false
      t.text :token, default: nil

      t.timestamps
    end
  end
end
