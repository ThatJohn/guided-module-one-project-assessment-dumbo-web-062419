class Menu

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
    options = ["Add #{selection.model_name.human}", "View #{selection}", "Edit #{selection}", "Delete #{selection}", "Return to main menu"]

    system("cls") || system("clear")
    user_response = @menu.select("What do you want to do?", options)

    view(selection) if user_response == "View #{selection}"
    add(selection) if user_response == "Add #{selection}"
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

    insertNew = @menu.ask("Please enter new #{selection}")
    selection.create(name: insertNew)

    # Ask about confirmation message and press enter to go back to main menu
    @menu.ok("#{selection} inserted successfully")
    sleep(3)
    main_menu
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