class CreateLectors < ActiveRecord::Migration[8.0]
  def change
    create_table :lectors do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :uuid

      t.timestamps
    end
  end
end
