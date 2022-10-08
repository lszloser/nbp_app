class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :code, limit: 3
      t.float :value
      t.belongs_to :day, index: true, foreign_key: true

      t.timestamps
    end
  end
end
