class AddDefaultToCompletionAttribute < ActiveRecord::Migration
  def up
    change_column :tasks, :completion, :boolean, :default => false
  end

  def down
    change_column :tasks, :completion, :boolean, :default => nil
  end
end
