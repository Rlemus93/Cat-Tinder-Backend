class ChangeColumnTypeInCat < ActiveRecord::Migration[7.1]
  def change
    change_column :cats, :image, :binary, limit: 10.megabytes, using: 'image::bytea'
  end
end
