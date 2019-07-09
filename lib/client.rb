class Client < ActiveRecord::Base
  has_many :job_order
  has_many :technicians, through: :job_orders
end