class CreateLotteries < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :lotteries, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.boolean :name_field_enabled, null: false, default: false
      t.boolean :note_field_enabled, null: false, default: false
      t.date :deadline, null: false

      t.timestamps
    end
  end
end
