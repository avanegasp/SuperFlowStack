class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.string :user
      t.integer :number
      t.string :type

      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
