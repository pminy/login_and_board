class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string :title
      t.text :content
      t.integer :user_id
      #한사람이 여러개의 게시글 작성가능 

      t.timestamps null: false
    end
  end
end
