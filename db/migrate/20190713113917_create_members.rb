class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.date :visa_exp
      t.date :wp_exp
      t.date :noti90
      t.date :passport_exp
      t.date :doe
      t.date :dob
      t.references :family

      t.timestamps
    end
  end
end
