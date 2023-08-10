class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.references :lottery, null: false, type: :uuid, foreign_key: true
      t.references :prize, foreign_key: true
      t.string :email, null: false
      t.string :name
      t.string :note

      t.timestamps
    end
  end
end
