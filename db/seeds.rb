# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
                               { title: 'frontend' },
                               { title: 'backend' },
                               { title: 'mobile development' },
                               { title: 'android' },
                               { title: 'iOS' }
                             ])

users = User.create([
                      { firstname: 'Ivan', lastname: 'Ivanov',
                        login: 'iivanov', password: 'pas1', email: 'aaa@bbb.com' },
                      { firstname: 'Alex', lastname: 'Petrov',
                        login: 'apetrov', password: 'pas2', email: 'aaa@bbb1.com', isadmin: true }
                    ])

tests = Test.create([
                      { title: 'Ruby', level: 1, category_id: categories[1].id, author_id: users[1].id },
                      { title: 'Javascript', category_id: categories[0].id, author_id: users[1].id },
                      { title: 'Ruby on Rails', level: 2, category_id: categories[1].id, author_id: users[1].id },
                      { title: 'CSS', level: 1, category_id: categories[0].id, author_id: users[1].id }
                    ])

TestsUser.create([
                   { user_id: users[0].id, test_id: tests[0].id },
                   { user_id: users[0].id, test_id: tests[2].id },
                   { user_id: users[1].id, test_id: tests[1].id }
                 ])

questions = Question.create([
                              { body: 'Etiam lacus dui, rutrum sit.', test_id: tests[0].id },
                              { body: 'Integer iaculis dignissim odio, non.', test_id: tests[1].id },
                              { body: 'Etiam lacus dui, rutrum sit.', test_id: tests[0].id },
                              { body: 'Duis dictum mauris a congue.', test_id: tests[2].id },
                              { body: 'Duis dictum mauris a congue.', test_id: tests[2].id },
                              { body: 'Aenean ullamcorper, quam a porttitor.', test_id: tests[3].id }
                            ])

Answer.create([
                { correct: true, question_id: questions[0].id, body: 'Morbi rhoncus purus.' },
                { question_id: questions[1].id, body: 'Nunc mollis elit.' },
                { correct: true, question_id: questions[2].id, body: 'Nyt osf kalium.' },
                { question_id: questions[0].id, body: 'Kop ha jui.' },
                { correct: true, question_id: questions[1].id, body: 'Pur lium gas' }
              ])
