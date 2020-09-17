class AddColumnToStudentDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :student_details, :parent2, :integer
  end
end
