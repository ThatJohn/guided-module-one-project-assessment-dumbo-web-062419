class Menux

  def initialize
    @menu = TTY::Prompt.new
  end

  def main_menu
    options = ["Manage technicians", "Manage orders", "Manage clients", "Advanced reports", "Exit"]

    system("cls") || system("clear")
    title
    user_response = @menu.select("What do you want to do?", options, per_page: 15 )

    manage(Technician) if user_response == "Manage technicians"
    manage(JobOrder) if user_response == "Manage orders"
    manage(Client) if user_response == "Manage clients"
  end

  def manage(selection)

    options = ["Add #{selection.model_name.human}", "View #{selection.model_name.human}", "Edit #{selection.model_name.human}", "Delete #{selection.model_name.human}", "Return to main menu"]

    system("cls") || system("clear")
    user_response = @menu.select("What do you want to do?", options)

    view(selection) if user_response == "View #{selection}"
    add(selection) if user_response == "Add #{selection}"
    add(JobOrder) if user_response == "Add Job order"
    delete(selection) if user_response == "Delete #{selection}"
    edit(selection) if user_response == "Edit #{selection}"
    main_menu if user_response == "Return to main menu"
  end

  def view(selection)
    options = selection.all.pluck(:name)

    system("cls") || system("clear")
    @menu.select("Here are your #{selection}, Press enter to go back to the main menu", options, per_page: 15)
    main_menu
  end

  def add(selection)
    system("cls") || system("clear")

    if selection == JobOrder
      technicians = Technician.all.pluck(:name)
      clients = Client.all.pluck(:name)

      newOrder = @menu.ask("Please enter a new job name")
      select_technician = @menu.select("Please assign a technician for this job", technicians, per_page: 15)
      select_client = @menu.select("Please select the client that requested the job", clients, per_page: 15)

      technician_to_insert = Technician.where(name: select_technician)
      client_to_insert = Client.where(name: select_client)
      # binding.pry

      JobOrder.create(name: newOrder, technician_id: technician_to_insert.ids[0], client_id: client_to_insert.ids[0], status: "In progress")
      @menu.ok("#{selection} inserted successfully")
      sleep(3)
      main_menu
    else


    insertNew = @menu.ask("Please enter new #{selection}")
    selection.create(name: insertNew)

    # Ask about confirmation message and press enter to go back to main menu
    @menu.ok("#{selection} inserted successfully")
    sleep(3)
    main_menu
      end
  end

  def delete(selection)
    system("cls") || system("clear")
    options = selection.all.pluck(:name)

    user_response = @menu.select("Please select record to delete", options, per_page: 15)
    selection.find_by_name(user_response).destroy
    main_menu
  end

  def edit(selection)
    system("cls") || system("clear")
    options = selection.all.pluck(:name)

    user_response = @menu.select("Please select record to edit", options, per_page: 15)
    newname = @menu.ask("Please enter new name")
    selection.find_by_name(user_response).update(name: newname)
    main_menu
  end

  def title
    puts "
         PC Doctors Management System

"

  end

end