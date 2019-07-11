# Create sample technicians
Technician.create(name: "John")
Technician.create(name: "Emmanuel")
Technician.create(name: "Lawson")
Technician.create(name: "Dan")
Technician.create(name: "Laurell")
Technician.create(name: "Amrit")
Technician.create(name: "Joe")
Technician.create(name: "Chris")
Technician.create(name: "Dennis")
Technician.create(name: "Larry")

Client.create(name: "Rachael")
Client.create(name: "Frank")
Client.create(name: "Dave")
Client.create(name: "Jason")
Client.create(name: "Luke")
Client.create(name: "Hannah")
Client.create(name: "Emma")
Client.create(name: "Trudy")
Client.create(name: "Shannon")
Client.create(name: "Austin")
Client.create(name: "Pat")

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