# frozen_string_literal: true

namespace :db do
  desc 'Add random articles to the db with random categories'
  task add_random_articles: :environment do
    category_ids = Category.pluck(:id)

    10.times do
      title = "Article Title #{rand(1000)}"
      body = "This is the content of the article #{rand(1000)}"

      random_category_id = category_ids.sample
      article = Article.create(title:, body:, category_id: random_category_id)
      puts "Article '#{title}' added to the category '#{article.category.name}'"
    end
    puts 'Rand articles have been added successfully.'
  end
end
