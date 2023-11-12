# frozen_string_literal: true

namespace :db do
  desc 'Add four categories to the database'
  task add_categories: :environment do
    # define your category name here
    category_names = %w[Technology Travel Food Fashion]

    category_names.each do |name|
      Category.find_or_create_by!(name:)
      puts "Category '#{name}' added."
    end

    puts 'Categories added successfully.'
  end
end
