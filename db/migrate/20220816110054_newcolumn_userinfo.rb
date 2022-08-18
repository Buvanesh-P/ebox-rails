class NewcolumnUserinfo < ActiveRecord::Migration[7.0]
  def change
    add_column :userinfos, :profile, :string
  end
end
