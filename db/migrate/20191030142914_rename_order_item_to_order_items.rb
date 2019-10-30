class RenameOrderItemToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders, :order_item, :order_items
  end
end
