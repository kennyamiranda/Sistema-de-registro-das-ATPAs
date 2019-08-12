class AddEditedbyToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :edited_by, :string
  end
end
