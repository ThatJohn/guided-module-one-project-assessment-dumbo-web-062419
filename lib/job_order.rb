class JobOrder < ActiveRecord::Base
  belongs_to :technician
  belongs_to :client
end