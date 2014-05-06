class SwitchDeviseToScratch < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :encrypted_password, :string
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :remember_created_at, :datetime
    remove_column :users, :sign_in_count, :integer
    remove_column :users, :current_sign_in_at, :datetime
    remove_column :users, :last_sign_in_at, :datetime
    remove_column :users, :current_sign_in_at, :string
    remove_column :users, :last_sign_in_ip, :string
  end
end

     ## Database authenticatable
     # t.string :encrypted_password, null: false, default: ""

      ## Recoverable
     # t.string   :reset_password_token
     # t.datetime :reset_password_sent_at

      ## Rememberable
     # t.datetime :remember_created_at

      ## Trackable
     # t.integer  :sign_in_count, default: 0, null: false
     # t.datetime :current_sign_in_at
     # t.datetime :last_sign_in_at
     # t.string   :current_sign_in_ip
     # t.string   :last_sign_in_ip

