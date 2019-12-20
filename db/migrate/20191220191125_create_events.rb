class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :vaccine_type
      t.date :date
      t.text :notes
      t.timestamps
    end
  end
end
