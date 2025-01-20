class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.string :author, array: true, default: []
      t.boolean :is_borrowed, default: false
      t.date :date, null: true

      t.timestamps
    end
  end
end
