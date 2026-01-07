#!/usr/bin/env ruby

require 'xcodeproj'

# Open the Xcode project
project_path = 'Runner.xcodeproj'
project = Xcodeproj::Project.open(project_path)

# Get the main target
target = project.targets.first

puts "Setting up flavor configurations for iOS..."
puts "Current configurations: #{project.build_configurations.map(&:name).join(', ')}"

# Define flavors and their bundle identifiers
flavors = {
  'Development' => {
    bundle_id: 'com.rclink.rclinkApp.dev',
    display_name: 'RCLink (Dev)'
  },
  'Staging' => {
    bundle_id: 'com.rclink.rclinkApp.staging',
    display_name: 'RCLink (Staging)'
  },
  'Production' => {
    bundle_id: 'com.rclink.rclinkApp',
    display_name: 'RCLink'
  }
}

# Base configurations to duplicate
base_configs = ['Debug', 'Release', 'Profile']

# Create flavor-specific configurations
flavors.each do |flavor_name, flavor_config|
  base_configs.each do |base_config|
    config_name = "#{base_config}-#{flavor_name}"

    # Check if configuration already exists
    existing_config = project.build_configurations.find { |c| c.name == config_name }

    if existing_config
      puts "Configuration '#{config_name}' already exists, updating..."
      new_config = existing_config
    else
      puts "Creating configuration: #{config_name}"

      # Find the base configuration
      base_configuration = project.build_configurations.find { |c| c.name == base_config }

      # Add new configuration to project
      new_config = project.add_build_configuration(config_name, base_configuration.type)

      # Copy all build settings from base configuration
      new_config.build_settings = base_configuration.build_settings.dup
    end

    # Set flavor-specific bundle identifier and display name
    new_config.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = flavor_config[:bundle_id]
    new_config.build_settings['APP_DISPLAY_NAME'] = flavor_config[:display_name]

    puts "  - Bundle ID: #{flavor_config[:bundle_id]}"
    puts "  - Display Name: #{flavor_config[:display_name]}"
  end
end

# Update target configurations
target.build_configurations.each do |config|
  flavors.each do |flavor_name, flavor_config|
    base_configs.each do |base_config|
      config_name = "#{base_config}-#{flavor_name}"

      if config.name == config_name
        config.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = flavor_config[:bundle_id]
        config.build_settings['APP_DISPLAY_NAME'] = flavor_config[:display_name]
      end
    end
  end
end

# Save the project
project.save

puts "\n✓ Successfully created flavor configurations!"
puts "\nNext steps:"
puts "1. Open Xcode: open ios/Runner.xcodeproj"
puts "2. Go to Product → Scheme → Edit Scheme"
puts "3. For each scheme (Development, Staging, Production):"
puts "   - Run → Build Configuration → Select Debug-[Flavor]"
puts "   - Profile → Build Configuration → Select Profile-[Flavor]"
puts "   - Archive → Build Configuration → Select Release-[Flavor]"
puts "\nOr run the update_schemes.rb script to do this automatically!"
