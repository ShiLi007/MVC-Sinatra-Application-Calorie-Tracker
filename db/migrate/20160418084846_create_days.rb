class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |d|
      d.string :name
      d.integer :user_id
    end
  end
end
