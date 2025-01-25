class ChangeLectorIdOnBooks < ActiveRecord::Migration[8.0]
  def change
    change_column_null :books, :lector_id, true
  end
end
