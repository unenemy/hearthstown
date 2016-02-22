# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[ :mage, :hunter, :priest, :paladin, :warlock, :warrior, :rogue, :shaman, :druid ].each do |class_code|
  Hero.find_or_create_by(code: class_code) do |hero|
    hero.title = class_code.to_s.humanize
  end
end
