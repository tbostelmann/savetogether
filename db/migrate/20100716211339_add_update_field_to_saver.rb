class AddUpdateFieldToSaver < ActiveRecord::Migration
  def self.up
    add_column :users, :update_description, :text
  end

  def self.down
    remove_column :users, :update_description
  end
end
