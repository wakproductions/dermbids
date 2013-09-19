FactoryGirl.define do
  factory :new_quote_request, :class=>QuoteRequest do
    full_name 'Abnercromnie Gnepufniak'
    email 'poofniak@wakproductions.com'
    postal_code '60601'
    formstack_photo_url '/public/images/sample_tattoo_01.jpg'
  end
end