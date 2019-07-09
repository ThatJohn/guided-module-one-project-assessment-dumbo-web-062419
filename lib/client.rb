class Client < ActiveRecord::Base
  has_many :job_order
  has_many :technicias, through: :job_orders
end