class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.integer :user_id
      t.integer :parent_id
      t.string :name
      t.text :description
      t.boolean :public

      t.timestamps
    end
  end
end
