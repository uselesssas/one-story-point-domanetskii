class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.belongs_to :author, index: true, foreign_key: true
      t.string :title
      t.string :genre
      t.integer :shelf

      t.timestamps
    end
  end
end
