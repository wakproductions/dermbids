json.array!(@organizations) do |organization|
  json.extract! organization, :business_name, :address1, :address2, :city, :state, :postal_code
  json.url organization_url(organization, format: :json)
end
