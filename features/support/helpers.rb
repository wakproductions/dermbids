# General helpers for making the cucumber tests work better
module CucumberHelpers
  def translate_factory_name(name)
    case name
      when /quote requests/
        :new_quote_request
      else
        raise "Class name not recognized for \"#{name}\"."
    end
  end
end

World(CucumberHelpers)