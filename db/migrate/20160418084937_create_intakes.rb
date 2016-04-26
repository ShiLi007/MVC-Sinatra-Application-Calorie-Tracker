class CreateIntakes < ActiveRecord::Migration
  def change
    create_table :intakes do |t|
      t.string :name
      t.integer :day_id
      t.integer :user_id
    end
  end
end
