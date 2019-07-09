class ChangeJobOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :job_orders do |t|
      t.string :status
    end
  end
end