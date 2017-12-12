class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.text :description
      t.belongs_to :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
