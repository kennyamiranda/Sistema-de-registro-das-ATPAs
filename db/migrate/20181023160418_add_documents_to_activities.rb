class AddDocumentsToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :documents, :json
  end
end
