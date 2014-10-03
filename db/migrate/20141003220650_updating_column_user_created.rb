class UpdatingColumnUserCreated < ActiveRecord::Migration
  def change
  	rename_column(:users, :created, :created_on)
  end
end
