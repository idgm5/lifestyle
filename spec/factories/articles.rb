# rubocop:disable Lint/UselessAssignment;
FactoryBot.define do
  include ActionDispatch::TestProcess
  factory :article do
    title { Faker::Book.title }
    text { Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3) }
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'cat.jpg'), 'image/jpg') }
    author_id { create(:user).id }
    category_id { create(:category).id }
  end
end
# rubocop:enable Lint/UselessAssignment;
