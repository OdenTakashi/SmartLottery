class CreatePrizes < ActiveRecord::Migration[7.0]
  def change
    create_table :prizes do |t|
      t.references :lottery, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.integer :winners_count, null: false
      t.string :winning_email_subject, null: false
      t.string :winning_email_body, null: false

      t.timestamps
    end
  end
end
