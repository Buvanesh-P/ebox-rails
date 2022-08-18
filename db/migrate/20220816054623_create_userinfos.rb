class CreateUserinfos < ActiveRecord::Migration[7.0]
  def change
    create_table :userinfos do |t|
      t.string :fullname
      t.string :address
      t.string :city
      t.string :designation
      t.string :phone
      t.string :emp_id
      t.string :emergency_number
      t.date :doj
      t.string :blood_group
      t.string :department
      t.date :dob
      t.string :users_id

      t.timestamps
    end
  end
end
