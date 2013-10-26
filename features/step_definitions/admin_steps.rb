Given /^a set of (.+) with the values of:$/ do |class_name, table|
  table.hashes.each do  |hash|
    FactoryGirl.create(translate_factory_name(class_name), hash)
  end
end