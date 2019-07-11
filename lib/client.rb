class Client < ActiveRecord::Base
  has_many :job_orders #available as instance.job_orders
  has_many :technicians, through: :job_orders
end