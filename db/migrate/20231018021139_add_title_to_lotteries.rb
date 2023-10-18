class AddTitleToLotteries < ActiveRecord::Migration[7.0]
  def change
    add_column :lotteries, :name, :string, default: "", null: false
  end
end
