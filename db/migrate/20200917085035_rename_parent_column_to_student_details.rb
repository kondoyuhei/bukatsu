class RenameParentColumnToStudentDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :student_details, :parent, :parent1
  end
end
