class AddQuantityIntegerToColors < ActiveRecord::Migration[7.0]
  def change
    add_column :colors, :quantity, :integer
  end
end
