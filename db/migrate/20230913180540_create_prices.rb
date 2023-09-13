class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.float :value
      t.time :time
      t.date :date

      t.timestamps
    end
  end
end
