require 'csv'
require 'faker'

headers = %w(name email title image phone imei color company date ip url state country lat long card)

SIZE = ARGV.size > 0 ? ARGV[0] : 1_000_000

REPETITION = 10

names = Array.new(REPETITION){ |i| Faker::Name.name }
emails = Array.new(REPETITION){ |i| Faker::Internet.email }
titles = Array.new(REPETITION){ |i| Faker::Name.title }
images = Array.new(REPETITION){ |i| Faker::Avatar.image }
phones = Array.new(REPETITION){ |i| Faker::PhoneNumber.cell_phone }
imeis = Array.new(REPETITION){ |i| Faker::Code.imei }
colors = Array.new(REPETITION){ |i| Faker::Color.color_name }
companies = Array.new(REPETITION){ |i| Faker::Company.name }
dates = Array.new(REPETITION){ |i| Faker::Date.between(Date.new(2010,11,01), Date.today) }
ips = Array.new(REPETITION){ |i| Faker::Internet.ip_v4_address }
urls = Array.new(REPETITION){ |i| Faker::Internet.url }
states = Array.new(REPETITION){ |i| Faker::Address.state }
countries = Array.new(REPETITION){ |i| Faker::Address.country }
lats = Array.new(REPETITION){ |i| Faker::Address.latitude }
longs = Array.new(REPETITION){ |i| Faker::Address.longitude }
cards = Array.new(REPETITION){ |i| Faker::Business.credit_card_number }


CSV.open('data.csv', 'w', write_headers: true, headers: headers) do |csv|
  SIZE.times do |i|
    csv << [
      names[i % REPETITION],
      emails[i % REPETITION],
      titles[i % REPETITION],
      images[i % REPETITION],
      phones[i % REPETITION],
      imeis[i % REPETITION],
      colors[i % REPETITION],
      companies[i % REPETITION],
      dates[i % REPETITION],
      ips[i % REPETITION],
      urls[i % REPETITION],
      states[i % REPETITION],
      countries[i % REPETITION],
      lats[i % REPETITION],
      longs[i % REPETITION],
      cards[i % REPETITION],
    ]
  end
end
