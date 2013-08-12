json.array!(@tattoo_removal_requests) do |tattoo_removal_request|
  json.extract! tattoo_removal_request, :image1_url, :image2_url, :reason, :location, :size, :inked_by, :ink_age, :colors, :skin_tone, :consultation_visit, :consultation_looking_reason_string, :first_name, :last_name, :email, :age, :zip, :referral
  json.url tattoo_removal_request_url(tattoo_removal_request, format: :json)
end
