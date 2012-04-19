class CreateCategoriesCompanies < ActiveRecord::Migration
  def up
    create_table 'categories_companies', :id => false do |t|
      t.column 'category_id', :integer
      t.column 'company_id', :integer
    end
  end

  def down
    drop table 'categories_companies'
  end
end
