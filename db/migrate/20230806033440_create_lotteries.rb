class CreateLotteries < ActiveRecord::Migration[7.0]
  def change
    create_table :lotteries do |t|
      t.boolean :name_field_enabled
      t.boolean :note_field_enabled
      t.date :deadline

      t.timestamps
    end
  end
end
