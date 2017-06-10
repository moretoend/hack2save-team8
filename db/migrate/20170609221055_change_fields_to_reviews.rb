class ChangeFieldsToReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :job_id
    add_column :reviews, :organization_grade, :integer
    add_column :reviews, :organization_notes, :text
    rename_column :reviews, :grade, :volunteer_grade
    rename_column :reviews, :notes, :volunteer_notes
  end
end
