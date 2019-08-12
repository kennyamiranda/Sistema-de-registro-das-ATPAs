class AddFeedbackToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :feedback, :text
  end
end
