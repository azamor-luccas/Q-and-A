class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: true, foreign_key: true
      t.references :answer, null: true, foreign_key: true

      t.timestamps
    end
  end
end
