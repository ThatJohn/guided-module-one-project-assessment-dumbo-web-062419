class Technician < ActiveRecord::Base
  has_many :job_orders
  has_many :clients, through: :job_orders
end