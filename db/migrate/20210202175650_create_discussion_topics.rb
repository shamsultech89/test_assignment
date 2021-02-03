class CreateDiscussionTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :discussion_topics do |t|
      t.string :title
      t.integer :campaign_id
      t.integer :user_id

      t.timestamps
    end
    add_index :discussion_topics, :campaign_id
    add_index :discussion_topics, :user_id
  end
end
