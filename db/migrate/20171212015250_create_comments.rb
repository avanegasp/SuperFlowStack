class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :user
      t.string :description
      t.date :date
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
