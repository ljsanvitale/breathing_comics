# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
#ENV.update YAML.load_file('config/application.yml')[Rails.env] rescue {}
