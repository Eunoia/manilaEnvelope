class RemoveUploaderFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :uploader
  end
end
