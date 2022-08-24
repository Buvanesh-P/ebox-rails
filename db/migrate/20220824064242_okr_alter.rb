class OkrAlter < ActiveRecord::Migration[7.0]
  def change
    remove_column :okrs, :year
  end
end
