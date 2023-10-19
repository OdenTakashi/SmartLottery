class AddDescriptionToLotteires < ActiveRecord::Migration[7.0]
  def change
    add_column :lotteries, :description, :text, default: "", null: false
  end
end
