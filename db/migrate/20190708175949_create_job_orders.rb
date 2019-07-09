class CreateJobOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :job_orders do |t|
      t.string :job_name
      t.integer :technician_id
      t.integer :client_id
    end
  end
end
