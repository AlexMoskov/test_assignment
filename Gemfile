# Gemfile
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '3.0.0'

gem 'httparty'
# testing
gem 'minitest'
gem 'minitest-reporters'
gem 'vcr'
gem 'webmock' # gem for stubbing and testing HTTP requests
gem 'simplecov'
