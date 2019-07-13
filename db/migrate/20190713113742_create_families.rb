class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string :name
      t.string :phone
      t.references :organization
      t.references :user

      t.timestamps
    end
  end
end
