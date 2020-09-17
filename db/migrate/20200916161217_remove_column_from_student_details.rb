class RemoveColumnFromStudentDetails < ActiveRecord::Migration[6.0]
  def change
    remove_column :student_details, :class, :string
    add_column :student_details, :classroom, :string
  end
end
