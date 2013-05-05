class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :systems, :public, :is_public
  end

  def down
  end
end
