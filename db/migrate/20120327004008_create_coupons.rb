class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.references :company
      t.string :name
      t.text :description
      t.text :disclaimer
      t.text :terms
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :coupons, :company_id
  end
end
