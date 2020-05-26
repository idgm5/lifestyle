class AddUniqueVote < ActiveRecord::Migration[6.0]
  def change
    add_index :votes, [:user_id, :article_id], unique: true
  end
end
