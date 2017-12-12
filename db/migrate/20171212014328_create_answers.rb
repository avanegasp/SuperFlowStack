class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :description
      t.belong_to :users
      t.belong_to :questions

      t.timestamps
    end
  end
end
