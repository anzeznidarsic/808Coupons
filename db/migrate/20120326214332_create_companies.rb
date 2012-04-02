class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :owner
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.date :date_opened
      t.string :email
      t.string :phone
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :youtube
      t.text :hours_of_operation
      t.string :industry
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
