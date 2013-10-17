FactoryGirl.define do
  factory :new_quote_request, :class=>QuoteRequest do
    full_name 'Abnercromnie Gnepufniak'
    email 'poofniak@wakproductions.com'
    postal_code '60601'
    formstack_photo_url 'sample_tattoo_01.jpg'
    photo File.new(Rails.root.join('spec', 'factories', 'files', 'sample_tattoo_01.jpg'), 'r')
  end
end