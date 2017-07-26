class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :description, limit: 45

      t.timestamps
    end
  end
end
