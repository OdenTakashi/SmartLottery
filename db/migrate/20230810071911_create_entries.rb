class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :email
      t.string :name
      t.string :note

      t.timestamps
    end
  end
end
