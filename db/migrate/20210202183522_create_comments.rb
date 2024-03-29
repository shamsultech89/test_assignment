class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.references :comments, :commentable, polymorphic: true

      t.timestamps
    end
  end
end
