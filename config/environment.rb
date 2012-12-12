# encoding: utf-8

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Qzrc::Application.initialize!

Time::DATE_FORMATS[:updated_time] = "更新于: %B %d at %I:%M %p"