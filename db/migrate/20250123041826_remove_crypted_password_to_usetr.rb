class RemoveCryptedPasswordToUsetr < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :crypted_password, :string
  end
end
