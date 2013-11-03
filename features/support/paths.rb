module NavigationHelpers
  def path_to(page_name)
    case page_name
      when /^the home page$/
        root_path
      when /^the user sign in page$/
        new_user_session_path

      when /^the administrator home page$/
        admin_root_path
      when /^the administrator quote request summary page$/
        admin_quote_requests_path

      # Add more page name => path mappings here

      else
        raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end

World(NavigationHelpers)