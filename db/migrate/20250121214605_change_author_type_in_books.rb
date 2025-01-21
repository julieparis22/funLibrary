class ChangeAuthorTypeInBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :author, :string
  end
end
