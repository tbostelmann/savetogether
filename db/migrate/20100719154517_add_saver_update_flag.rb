class AddSaverUpdateFlag < ActiveRecord::Migration
  def self.up
    add_column :users, :receive_saver_updates, :boolean, :default => true
  end

  def self.down
    remove_column :users, :receive_saver_updates
  end
end
