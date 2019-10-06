class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string :passport_no, unique: true
      t.string :name
      t.string :phone
      t.references :user, :null => true

      t.timestamps
    end
  end
end
