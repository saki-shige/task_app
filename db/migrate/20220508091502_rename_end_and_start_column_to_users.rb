class RenameEndAndStartColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :end, :end_at
    rename_column :tasks, :start, :start_at

  end
end
