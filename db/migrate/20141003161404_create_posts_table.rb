class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :post_in
  		t.datetime :created_on
  	end
  end
end
