class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.references :user

      t.timestamps
    end
  end
end
