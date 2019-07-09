class Menu

  def initialize
    @menu = TTY::Prompt.new
  end

  def main_menu
    options = ["Manage technicians", "Manage orders", "Manage clients"]

    system("clear")
    user_response = @menu.select("What do you want to do?", options, per_page: 15 )

    manage(Technician) if user_response == "Manage technicians"
    manage(JobOrder) if user_response == "Manage orders"
    manage(Client) if user_response == "Manage clients"

  end

  def manage(selection)
    options = ["Add #{selection}", "View #{selection}", "Edit #{selection}", "Delete #{selection}"]

    system("Clear")
    user_response = @menu.select("What do you want to do?", options)

    view(selection) if user_response == "View #{selection}"
    add(selection) if user_response == "Add #{selection}"

  end

  def view(selection)
    options = selection.all.pluck(:name)

    system("clear")
    @menu.select("Here are your #{selection}, Press enter to go back to the main menu", options, per_page: 15)
    main_menu
  end

  def add(selection)
    system("clear")

    insertNew = @menu.ask("Please enter new #{selection}")
    selection.create(name: insertNew)

  end

end
