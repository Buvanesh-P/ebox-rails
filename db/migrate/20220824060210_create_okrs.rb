class CreateOkrs < ActiveRecord::Migration[7.0]
  def change
    create_table :okrs do |t|
      t.integer :users_id
      t.integer :userinfos_id
      t.string :month
      t.string :year

      t.timestamps
    end
  end
end
