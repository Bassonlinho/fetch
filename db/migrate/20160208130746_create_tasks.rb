class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :url
      t.string :words
      t.string :email
      t.boolean :completed, :default => 'false'

      t.timestamps null: false
    end
  end
end
