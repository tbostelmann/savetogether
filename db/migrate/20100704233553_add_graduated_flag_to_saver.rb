class AddGraduatedFlagToSaver < ActiveRecord::Migration
  def self.up
    add_column :users, :saver_graduated, :boolean, :default => false
  end

  def self.down
    remove_column :users, :saver_graduated
  end
end
