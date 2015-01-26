require 'csv'


namespace :export do

  desc 'Exports Users'
  task :users => :environment do
    HEADER_NAMES = ['name', 'email']

    csv_file = CSV.open('users.csv','wb')
    csv_file << HEADER_NAMES

    User.all.each do |user|
      data = user.attributes.slice(*HEADER_NAMES)
      data = user.attributes.slice('name', 'email')
      csv_file << data.values
    end
  end

end

