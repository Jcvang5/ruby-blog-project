# frozen_string_literal: true

# lib/tasks/descriptions.rake
namespace :db do
  desc 'Backfill category descriptions'
  task backfill: :environment do
    Category.where(description: nil).each do |category|
      # Add logic to set description here
      category.update(description: 'Default Description')
    end
  end
end
