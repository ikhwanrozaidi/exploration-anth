#!/usr/bin/env ruby
require 'xcodeproj'

project_path = 'Runner.xcodeproj'
project = Xcodeproj::Project.open(project_path)

puts "Opening #{project_path}..."

# Set bridging header for ALL build configurations
project.build_configurations.each do |config|
  config_name = config.name

  current_value = config.build_settings['SWIFT_OBJC_BRIDGING_HEADER']

  if current_value != 'Runner/Runner-Bridging-Header.h'
    puts "Setting SWIFT_OBJC_BRIDGING_HEADER for #{config_name}"
    config.build_settings['SWIFT_OBJC_BRIDGING_HEADER'] = 'Runner/Runner-Bridging-Header.h'
  else
    puts "#{config_name} already has bridging header set"
  end
end

# Save the project
project.save
puts "\n✅ Successfully set bridging header for all configurations!"
