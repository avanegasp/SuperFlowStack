class ChangeColumnVotableToVotes < ActiveRecord::Migration[5.1]
  def change
  	rename_column :votes, :commentable_type, :votable_type
  	rename_column :votes, :commentable_id, :votable_id

  end
end
