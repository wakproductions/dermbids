require 'paperclip/matchers'

FactoryGirl.define do
  sequence :full_name do |n|
    "Sparactus Quotesubmitter#{n}"
  end

  sequence :email do |n|
    "spartacus.quotesubmitter#{n}@example.com"
  end

  factory :new_quote_request, :class=>QuoteRequest do
    full_name { generate(:full_name) }
    email { generate(:email) }
    postal_code '60601'
    formstack_photo_url 'sample_tattoo_01.jpg'  # we're going to start stubbing out Paperclip shortly

    # These properties stub out the Paperclip properties, so that we don't make the calls to Amazon S3
    photo_file_name 'sample_tattoo_01.jpg'
    photo_content_type 'image/jpeg'
    photo_file_size 1024
    photo_updated_at { Time.now }

    # Uncomment the below if you actually want to test the photo attachment system
    #photo File.new(Rails.root.join('spec', 'factories', 'files', 'sample_tattoo_01.jpg'), 'r')
    #photo fixture_file_upload(Rails.root.join('spec', 'factories', 'files', 'sample_tattoo_01.jpg'))
  end
end