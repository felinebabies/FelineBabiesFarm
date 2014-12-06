# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#初期roleの追加
Role.first_or_create([
  {:id => 1, :name => 'superadmin'},
  {:id => 2, :name => 'admin'}
])

#管理ユーザの追加
User.first_or_create([
  {:id => 1, :email => ENV['ADMIN_EMAIL'] , :password => ENV['ADMIN_PASSWORD']}
])


#管理ユーザへの管理者権限付与
adminUser = User.where(:id => 1)
adminUser.roles << Role.where(:name => 'superadmin')
adminUser.roles << Role.where(:name => 'admin')
adminUser.save
