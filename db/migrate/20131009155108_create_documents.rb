class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :case_number
      t.string :filepicker_url
      t.string :uploader
      t.datetime :date_opened
      t.string :case_name
      t.boolean :paid

      t.timestamps
    end
  end
end
