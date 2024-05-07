# frozen_string_literal: true

users = User.create([{ email: 'user@user.com', password: 'password' }, { email: 'john@gmail.com', password: 'johnny' }])
categories = Category.create(%w[Sport News Cars Internet].map { |name| { name: } })

posts = Post.create([
                      {
                        title: 'Секреты успешного тренировочного процесса',
                        body: 'Хотите достичь высоких результатов в спорте? Этот пост раскроет некоторые секреты успешной тренировки, которые помогут вам улучшить вашу физическую подготовку и достичь новых высот в спортивных достижениях. Рассмотрим такие аспекты как правильное питание, режим тренировок, важность психологической устойчивости и многое другое. Вместе с этим вы узнаете о современных тенденциях в мире спорта и наиболее эффективных методиках тренировок.',
                        category: categories.first,
                        creator: users.first
                      },
                      {
                        title: 'Безопасность в интернете: советы для защиты личной информации',
                        body: 'С каждым днем интернет становится все более важной частью нашей жизни. Однако вместе с этим возрастает и опасность потери личных данных и конфиденциальной информации. В этом посте вы найдете полезные советы и рекомендации по обеспечению безопасности в онлайн-среде, чтобы защитить себя от киберугроз и сохранить вашу личную информацию в сохранности. Мы также обсудим основные уязвимости, с которыми сталкиваются пользователи интернета, и какие меры предосторожности можно принять, чтобы избежать их.',
                        category: categories.last,
                        creator: users.second
                      }
                    ])

comments = PostComment.create([
                                { content: 'Отличная статься, level: root', post: posts.first, user: users.first },
                                { content: 'Согласен, но не полностью! level: root', post: posts.first,
                                  user: users.second }
                              ])
nested_comments = comments.first.children.create([
                                                   { content: 'А что, так можно было? level: nested', post: posts.first,
                                                     user: users.second },
                                                   { content: 'Не уверен, что это поможет.. level: nested', post: posts.first,
                                                     user: users.first }
                                                 ])
nested_comments.first.children.create([
                                        { content: 'Это просто фантастика? level: deep nested', post: posts.first,
                                          user: users.second },
                                        { content: 'Почему так много обсуждений? level: deep nested', post: posts.first,
                                          user: users.first }
                                      ])
