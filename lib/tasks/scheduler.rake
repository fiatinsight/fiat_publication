#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,

desc "Unsnooze all the things"
task unsnooze_things: :environment do
  puts "Unsnoozing all the things..."
  FiatPublication::SnoozesController.new.auto_unsnooze
end
