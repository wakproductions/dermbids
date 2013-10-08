class State < ActiveRecord::Base
  alias_attribute :to_s, :abbr

  def self.find_state(abbr, country_id=1)
    where(abbr: abbr, country_id: country_id).first
  end
end
