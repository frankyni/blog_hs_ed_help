class CreateTableUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.datetime :created
    end
  end
end
