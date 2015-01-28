namespace :export do
  desc 'Exports Items'

  task :items => :environment do
    ITEM_HEADER_NAMES = ['name', 'description', 'is_out']

    csv_file = CSV.open('items.csv','wb')
    csv_file << ITEM_HEADER_NAMES

    Item.all.each do |item|
      data = item.attributes.slice(*ITEM_HEADER_NAMES)
      csv_file << data.values
    end
  end

end

