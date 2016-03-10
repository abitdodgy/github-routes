# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Account.delete_all
Account.create(name: 'ACME', slug: 'acme')

Project.delete_all
Account.first.projects.create([{ name: 'Project One', slug: 'project_one' }, { name: 'Project Two', slug: 'project_two' }])
