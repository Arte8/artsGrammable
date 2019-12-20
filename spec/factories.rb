include ActionDispatch::TestProcess

FactoryBot.define do
  factory :comment do

  end

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"  
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :gram do
    message { "hello" }
    picture { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'picture.png').to_s, 'image/png') }
    # picture {Rack::Test::UploadedFile.new('spec/fixtures/picture.png', 'image/png')}
    # picture { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/picture.png'), 'image/png') }
    association :user
  end
end
