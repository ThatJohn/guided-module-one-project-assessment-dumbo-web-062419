class Technician < ActiveRecord::Base
  has_many :job_order
  has_many :clients, through: :job_orders
end