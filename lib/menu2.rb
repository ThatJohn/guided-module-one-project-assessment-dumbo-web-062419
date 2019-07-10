class Menu
  def initialize
    @menu = TTY::Prompt.new
  end

  def title
    system("cls") || system("clear")
    puts ""
    puts "WELCOME TO PC DOCTORS"
    puts ""
  end

  def main_menu

    title

    @menu.select("What would you like to do?") do |menu|
      menu.choice "Manage technicians", -> { view(Technician) }
      menu.choice "Manage orders", -> { view(JobOrder) }
      menu.choice "Manage clients", -> { view(Client) }
      menu.choice "Exit"
    end
  end

  def view(model)

    title

    current_model = "technician" if model == Technician
    current_model = "job order" if model == JobOrder
    current_model = "client" if model == Client
    whatModel = model.all

    @menu.select("Here's a list of your #{current_model}s", per_page: 15) do |menu|
      menu.choice "Add a new one", -> {add(model)}
      menu.choice "Go back to the main menu", -> {main_menu}
      whatModel.each do |item|
        if model == JobOrder
          menu.choice "#{item.name} by #{item.technician.name} for #{item.client.name} with a status of #{item.status}", -> {whatToDo(model, item.id)}
        else
          menu.choice item.name, -> {whatToDo(model, item.id)}
        end
      end
    end
  end

  def whatToDo(model, id)
    title
    # system("cls") || system("clear")

    @menu.select("What would you like to do with it?") do |menu|
      menu.choice "Edit", -> {edit(model, id)}
      menu.choice "Delete", -> {delete(model, id)}
      menu.choice "Cancel", -> {view(model)}
    end
  end

  def add(model)
    title
    current_model = "technician" if model == Technician
    current_model = "job order" if model == JobOrder
    current_model = "client" if model == Client

    if model == JobOrder
      theClient = 0
      theTech = 0

      newJob = @menu.ask("Please enter the description of the new #{current_model}")
      @menu.select("Please assign a technician", per_page: 15) do |menu|
        techList = Technician.all
        techList.each do |tech|
          menu.choice tech.name, -> {theTech = tech.id}
        end
      end

      @menu.select("Please select the client of this job")do |menu|
        clientList = Client.all
        clientList.each do |client|
          menu.choice client.name, -> {theClient = client.id}
        end
      end

      JobOrder.create(name: newJob, technician_id: theTech, client_id: theClient, status: "In progress")
      @menu.ok("#{newJob} inserted successfully")
      sleep(2)
      main_menu

    else
      insertNew = @menu.ask("Please enter a name for the new #{current_model}")
      model.create(name: insertNew)
      @menu.ok("#{insertNew} inserted successfully")
      sleep(2)
      main_menu
    end
  end

  def delete(model, id)
    whoToDelete = model.find_by(id: id)

    @menu.no?("Are you sure?")
    whoToDelete.destroy
    @menu.ok("#{whoToDelete.name} deleted successfully")
    sleep(2)
    main_menu
  end

  def edit(model, id)

    if model == JobOrder
      whoToEdit = model.find_by(id: id)
      theClient = 0
      theTech = 0
      theStatus = ""
      newDescription = @menu.ask("Please enter a new description for the job order")

      @menu.select("Please assign a technician", per_page: 15) do |menu|
        techList = Technician.all
        techList.each do |tech|
          menu.choice tech.name, -> {theTech = tech.id}
        end
      end

      @menu.select("Please select the client of this job") do |menu|
        clientList = Client.all
        clientList.each do |client|
          menu.choice client.name, -> {theClient = client.id}
        end
      end

      @menu.select("Select the status of the job") do |menu|
        menu.choice "In progress", -> {theStatus = "In progress"}
        menu.choice "Complete", -> {theStatus = "Complete"}
      end


      whoToEdit.update(name: newDescription, technician_id: theTech, client_id: theClient, status: "In progress")
      @menu.ok("Job updated successfully")
      sleep(2)
      main_menu

    else
      whoToEdit = model.find_by(id: id)

      newName = @menu.ask("Please enter a new name")
      whoToEdit.update(name: newName)

      @menu.ok("#{whoToEdit.name} renamed successfully")
      sleep(2)
      main_menu
    end


  end



end