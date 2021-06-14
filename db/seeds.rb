# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(user_name:"First_user",email:"first@edhec.com",password:"azerty")
User.create(user_name:"Second_user",email:"second@edhec.com",password:"azerty")
User.create(user_name:"First_user",email:"first@edhec.com",password:"azerty")
User.create(user_name:"Second_user",email:"second@edhec.com",password:"azerty")

Tool.create(user_id:9,tool_name:"hammer",price:5,tool_description:"nice wooden hammer")
Tool.create(user_id:10,tool_name:"saw",price:7,tool_description:"nice iron saw")
Tool.create(user_id:11,tool_name:"hammer",price:5,tool_description:"nice wooden hammer")
Tool.create(user_id:12,tool_name:"saw",price:7,tool_description:"nice iron saw")
