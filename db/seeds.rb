# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# angie = User.create(name:"angie", last_name:"vanegas", country:"Colombia", age:31, email:"a@a.com", password:"1234567")
angie = User.create(name:"angie", last_name:"vanegas", country:"Colombia", age:31, email:"angie@a.com", password:"1234567")

q1 = angie.questions.create(title:"Mi primera pregunta", description:"Acá esta mi primera pregunta")

cq1 = q1.comments.create(description:"comentario de la pregunta 1", user_id: angie.id)

aq1 = Question.find(1).answers.create(description:"respuesta", user_id: User.find(1).id)

v1 = Question.find(1).votes.create(number: 3, user_id: User.find(1).id)
