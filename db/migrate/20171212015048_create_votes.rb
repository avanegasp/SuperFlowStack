class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :number
      t.belongs_to :user
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
