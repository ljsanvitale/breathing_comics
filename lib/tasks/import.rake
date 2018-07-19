# Define a namespace for the task
namespace :import do
  # Give a description for the task
  desc 'Generate slugs for all the articles'
  # Define the task
  task generate_slugs: :environment do
    art= Article.all
    art.each do |a|
      a.article_slug = a.title.strip.downcase.gsub(" ", "-")
      a.save
    end
    # Your task goes here
  end
end
