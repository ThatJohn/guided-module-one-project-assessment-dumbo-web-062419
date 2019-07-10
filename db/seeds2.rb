require 'pry'

jobname = [
  "Hard drive backup",
   "OS reinstall",
   "Virus removal",
   "CPU upgrade",
   "Video card replacement",
   "Keyboard cleanup",
   "RAM upgrade",
   "PSU replacement",
   "Motherboard swap",
   "OS reinstall",
   "Virus removal",
   "Hard drive replacement",
   "Printer installation",
   "Wifi configuration",
   "Driver installation",
   "Office installation",
   "Data recovery",
   "Data backup",
   "CPU overclock",
   "Monitor calibration"
]

status = ["Completed", "In progress"]

235.times do
    JobOrder.create(name: jobname.sample, technician_id: rand(1..10), client_id: rand(1..10), status: status.sample)
end

binding.pry