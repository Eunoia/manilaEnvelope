class AddMailingListToUser < ActiveRecord::Migration
  def change
    add_column :users, :mailing_list, :boolean
  end
end
