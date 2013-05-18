class CreateComments < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
  		t.string :body
  		t.integer :user_id
  		t.integer :post_id
  	end
  end

  def down
  	drop_table :comments
  end
end
