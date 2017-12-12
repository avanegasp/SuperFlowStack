class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :description
      t.belongs_to :users
      t.belongs_to :questions

      t.timestamps
    end
  end
end
