# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Answer.create([
                { correct: true, question_id: 1 },
                { question_id: 2 },
                { correct: true, question_id: 3 },
                { question_id: 1 },
                { correct: true, question_id: 2 }
              ])

Category.create([
                  { title: 'frontend' },
                  { title: 'backend' },
                  { title: 'mobile development' },
                  { title: 'android' },
                  { title: 'iOS' }
                ])

Question.create([
                  { body: 'Etiam lacus dui, rutrum sit.', test_id: 1 },
                  { body: 'Integer iaculis dignissim odio, non.', test_id: 2 },
                  { body: 'Etiam lacus dui, rutrum sit.', test_id: 1 },
                  { body: 'Duis dictum mauris a congue.', test_id: 3 },
                  { body: 'Duis dictum mauris a congue.', test_id: 3 },
                  { body: 'Aenean ullamcorper, quam a porttitor.', test_id: 4 }
                ])

Test.create([
              { title: 'Ruby', level: 1, category_id: 2 },
              { title: 'Javascript', category_id: 1 },
              { title: 'Ruby on Rails', level: 2, category_id: 2 },
              { title: 'CSS', level: 1, category_id: 1 }
            ])

User.create([
              { firstname: 'Ivan', lastname: 'Ivanov',
                login: 'iivanov', password: 'pas1', email: 'aaa@bbb.com' },
              { firstname: 'Alex', lastname: 'Petrov',
                login: 'apetrov', password: 'pas2', email: 'aaa@bbb1.com', isadmin: true }
            ])

TestsUser.create([
                   { user_id: 1, test_id: 1 },
                   { user_id: 1, test_id: 3 },
                   { user_id: 2, test_id: 2 }
                 ])
