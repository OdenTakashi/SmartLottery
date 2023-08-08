class CreatePrizes < ActiveRecord::Migration[7.0]
  def change
    create_table :prizes do |t|
      t.string :name
      t.integer :winners_count
      t.string :winning_email_subject
      t.string :winning_email_body

      t.timestamps
    end
  end
end
