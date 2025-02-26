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

# Create sample job orders
JobOrder.create(name: "Hard drive backup", technician_id: "3", client_id: "3", status: "Complete")
JobOrder.create(name: "OS reinstall", technician_id: "5", client_id: "2", status: "Complete")
JobOrder.create(name: "Virus removal", technician_id: "2", client_id: "8", status: "In progress")
JobOrder.create(name: "CPU upgrade", technician_id: "4", client_id: "4", status: "Complete")
JobOrder.create(name: "Video card replacement", technician_id: "3", client_id: "4", status: "In progress")
JobOrder.create(name: "Keyboard cleanup", technician_id: "6", client_id: "5", status: "In progress")
JobOrder.create(name: "RAM upgrade", technician_id: "3", client_id: "4", status: "Complete")
JobOrder.create(name: "PSU replacement", technician_id: "1", client_id: "8", status: "Complete")
JobOrder.create(name: "Motherboard swap", technician_id: "1", client_id: "1", status: "In progress")
JobOrder.create(name: "OS reinstall", technician_id: "1", client_id: "1", status: "In progress")
JobOrder.create(name: "Virus removal", technician_id: "2", client_id: "7", status: "Complete")
JobOrder.create(name: "Hard drive replacement", technician_id: "5", client_id: "4", status: "In progress")
JobOrder.create(name: "Printer installation", technician_id: "3", client_id: "4", status: "In progress")
JobOrder.create(name: "Wifi configuration", technician_id: "6", client_id: "6", status: "Complete")
JobOrder.create(name: "Driver installation", technician_id: "4", client_id: "5", status: "Complete")
JobOrder.create(name: "Office installation", technician_id: "3", client_id: "9", status: "In progress")
JobOrder.create(name: "Data recovery", technician_id: "5", client_id: "9", status: "Complete")
JobOrder.create(name: "Data backup", technician_id: "5", client_id: "7", status: "In progress")
JobOrder.create(name: "CPU overclock", technician_id: "2", client_id: "7", status: "In progress")
JobOrder.create(name: "Monitor calibration", technician_id: "3", client_id: "4", status: "Complete")

# Create sample clients
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