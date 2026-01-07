#!/usr/bin/env ruby

require 'xcodeproj'

# Open the Xcode project
project_path = 'Runner.xcodeproj'
project = Xcodeproj::Project.open(project_path)

puts "Updating schemes to use flavor-specific configurations..."

# Scheme mappings
scheme_configs = {
  'Development' => {
    debug: 'Debug-Development',
    profile: 'Profile-Development',
    release: 'Release-Development'
  },
  'Staging' => {
    debug: 'Debug-Staging',
    profile: 'Profile-Staging',
    release: 'Release-Staging'
  },
  'Production' => {
    debug: 'Debug-Production',
    profile: 'Profile-Production',
    release: 'Release-Production'
  }
}

schemes_path = 'Runner.xcodeproj/xcshareddata/xcschemes'

scheme_configs.each do |scheme_name, configs|
  scheme_file = "#{schemes_path}/#{scheme_name}.xcscheme"

  unless File.exist?(scheme_file)
    puts "Warning: Scheme file not found: #{scheme_file}"
    next
  end

  puts "\nUpdating #{scheme_name} scheme..."

  # Read the scheme file
  scheme_content = File.read(scheme_file)

  # Update LaunchAction (Run) - use Debug
  scheme_content.gsub!(
    /<LaunchAction[^>]*buildConfiguration\s*=\s*"Debug"/,
    "<LaunchAction\n      buildConfiguration = \"#{configs[:debug]}\""
  )

  # Update TestAction - use Debug
  scheme_content.gsub!(
    /<TestAction[^>]*buildConfiguration\s*=\s*"Debug"/,
    "<TestAction\n      buildConfiguration = \"#{configs[:debug]}\""
  )

  # Update ProfileAction - use Profile
  scheme_content.gsub!(
    /<ProfileAction[^>]*buildConfiguration\s*=\s*"Profile"/,
    "<ProfileAction\n      buildConfiguration = \"#{configs[:profile]}\""
  )

  # Update AnalyzeAction - use Debug
  scheme_content.gsub!(
    /<AnalyzeAction[^>]*buildConfiguration\s*=\s*"Debug"/,
    "<AnalyzeAction\n      buildConfiguration = \"#{configs[:debug]}\""
  )

  # Update ArchiveAction - use Release
  scheme_content.gsub!(
    /<ArchiveAction[^>]*buildConfiguration\s*=\s*"Release"/,
    "<ArchiveAction\n      buildConfiguration = \"#{configs[:release]}\""
  )

  # Write back
  File.write(scheme_file, scheme_content)

  puts "  ✓ Run: #{configs[:debug]}"
  puts "  ✓ Test: #{configs[:debug]}"
  puts "  ✓ Profile: #{configs[:profile]}"
  puts "  ✓ Analyze: #{configs[:debug]}"
  puts "  ✓ Archive: #{configs[:release]}"
end

puts "\n✓ All schemes updated successfully!"
puts "\nYou can now run:"
puts "  flutter run --flavor development -t lib/main_development.dart"
puts "  flutter run --flavor staging -t lib/main_staging.dart"
puts "  flutter run --flavor production -t lib/main_production.dart"
