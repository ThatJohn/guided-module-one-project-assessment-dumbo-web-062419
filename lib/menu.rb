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
    whoToManage = selection.all.pluck(:name)
    options = ["Add #{selection}", "View #{selection}", "Edit #{selection}", "Delete #{selection}"]

    system("Clear")
    @menu.select("What do you want to do?", options)
  end

end
