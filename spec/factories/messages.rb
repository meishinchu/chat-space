FactoryGirl.define do

  factory :message do
    text        { Faker::Lorem.sentence }
    image       { Rack::Test::UploadedFile.new Rails.root.join('spec/fixtures/image.jpg'), 'image/jpg'}
    user
    group
  end

end
