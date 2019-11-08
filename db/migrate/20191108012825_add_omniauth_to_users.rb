class AddOmniauthToUsers < ActiveRecord::Migration[6.0]
  def change
   add_column :users, :provider, :string
   add_column :users, :uid, :string
   add_column :users, :name, :string
   add_column :users, :token, :string
   add_column :users, :current_sign_in_at, :time
   add_column :users, :last_sign_in_at, :time
   add_column :users, :current_sign_in_ip, :string
   add_column :users, :last_sign_in_ip, :string
   add_column :users, :sign_in_count, :string
   add_column :users, :payment, :boolean
   add_column :users, :stripe_id, :string
   add_column :users, :stripe_email, :string
   add_column :users, :subscription_id, :string
  end
end
