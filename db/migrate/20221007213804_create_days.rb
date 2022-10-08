class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.date :date, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
