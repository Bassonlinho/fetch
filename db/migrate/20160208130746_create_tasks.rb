class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :url
      t.string :words
      t.string :email
      t.integer :status, :limit => 1, :default => 1, :null => false

      t.timestamps null: false
    end
  end
end
