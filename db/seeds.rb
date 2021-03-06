Favorite.destroy_all
Application.destroy_all
Pet.destroy_all
User.destroy_all

require 'faker'

puts 'Seeding database with all the furry friends..'

@user_1 = User.create(id: 1,
                      username: Faker::Internet.username,
                      email: Faker::Internet.free_email)
@user_2 = User.create(id: 2,
                      username: Faker::Internet.username,
                      email: Faker::Internet.free_email)
@user_3 = User.create(id: 3,
                      username: Faker::Internet.username,
                      email: Faker::Internet.free_email)
@user_4 = User.create(id: 4,
                      username: Faker::Internet.username,
                      email: Faker::Internet.free_email)
@user_5 = User.create(id: 5,
                      username: Faker::Internet.username,
                      email: Faker::Internet.free_email)
@user_6 = User.create(id: 6,
                      username: Faker::Internet.username,
                      email: Faker::Internet.free_email)
@user_7 = User.create(id: 7,
                      username: Faker::Internet.username,
                      email: Faker::Internet.free_email)

@pet_1 = Pet.create(id: 1,
                   user_id: @user_1.id,
                   name: Faker::Creature::Dog.name,
                   age: 4,
                   pet_type: 1,
                   breed: "Pug",
                   description: "This is a great dog!",
                   gender: Faker::Creature::Dog.gender,
                   fixed: true,
                   house_trained: true,
                   photo_url_1: "https://thehappypuppysite.com/wp-content/uploads/2019/04/How-Long-Do-Pugs-Live-long.jpg",
                   photo_url_2: "https://i1.wp.com/nypost.com/wp-content/uploads/sites/2/2020/04/pugs-coronavirus.jpg?quality=80&strip=all&ssl=1",
                   photo_url_3: "https://www.purina.com.au/-/media/project/purina/main/breeds/dog/mobile/dog_pugs_mobile.jpg?h=300&la=en&w=375&hash=5BF9CFC4E6FC7347E6FDA383E42D8A52",
                   good_with_kids: true,
                   good_with_animals: true)
@pet_2 = Pet.create(id: 2,
                   user_id: @user_1.id,
                   name: Faker::Creature::Dog.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 1,
                   breed: "Pomeranian",
                   description: "This dog is so fluffy",
                   gender: Faker::Creature::Dog.gender,
                   fixed: [true, false].sample,
                   house_trained: [true, false].sample,
                   photo_url_1: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/09/12211850/curly_pom_hero.jpg",
                   photo_url_2: "https://thehappypuppysite.com/wp-content/uploads/2019/09/Fluffy-Dogs-HP-long.jpg",
                   photo_url_3: nil,
                   good_with_kids: [true, false].sample,
                   good_with_animals: [true, false].sample)
@pet_3 = Pet.create(id: 3,
                   user_id: @user_1.id,
                   name: Faker::Creature::Cat.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 2,
                   breed: "Ragdoll",
                   description: "This kitty loves to sleep!",
                   gender: 'female',
                   fixed: [true, false].sample,
                   house_trained: [true, false].sample,
                   photo_url_1: "https://i.pinimg.com/originals/f1/8f/9a/f18f9a971ce3201b2da52fc1bbc0f283.jpg",
                   photo_url_2: "http://exoticpetinformation.weebly.com/uploads/2/4/3/1/24318708/2845483.jpg",
                   photo_url_3: nil,
                   good_with_kids: [true, false].sample,
                   good_with_animals: [true, false].sample)
@pet_4 = Pet.create(id: 4,
                   user_id: @user_2.id,
                   name: Faker::Creature::Cat.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 2,
                   breed: "Tabby",
                   description: "They are so snuggly",
                   gender: 'male',
                   fixed: [true, false].sample,
                   house_trained: [true, false].sample,
                   photo_url_1: "https://www.pumpkin.care/blog/wp-content/uploads/2020/11/10-Best-Names-For-Tabby-Cats.jpg",
                   photo_url_2: "https://www.thehappycatsite.com/wp-content/uploads/2017/10/30-Awesome-Tabby-Cat-Facts-HC-long.jpg",
                   photo_url_3: "https://epicpetclub.com/wp-content/uploads/2020/08/image-of-a-fat-tabby-cat.jpg",
                   good_with_kids: [true, false].sample,
                   good_with_animals: [true, false].sample)
@pet_5 = Pet.create(id: 5,
                   user_id: @user_2.id,
                   name: Faker::Creature::Cat.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 2,
                   breed: "Bengal",
                   description: "They are looking for a good home!",
                   gender: 'male',
                   fixed: [true, false].sample,
                   house_trained: [true, false].sample,
                   photo_url_1: "https://assets3.thrillist.com/v1/image/2622128/1200x600/crop;",
                   photo_url_2: "https://bengalcatcare.com/wp-content/uploads/2020/08/bengal-cat-genetics.jpg",
                   photo_url_3: "https://www.thesprucepets.com/thmb/kwGfWsJ_HgbqSw9fRmQIhdLpCa4=/1553x1553/smart/filters:no_upscale()/bengalcat-56a2bcd95f9b58b7d0cdf798.jpg",
                   good_with_kids: [true, false].sample,
                   good_with_animals: [true, false].sample)
@pet_6 = Pet.create(id: 6,
                   user_id: @user_2.id,
                   name: Faker::Creature::Dog.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 1,
                   breed: "Dachshund",
                   description: "They love to play fetch!",
                   gender: Faker::Creature::Dog.gender,
                   fixed: [true, false].sample,
                   house_trained: [true, false].sample,
                   photo_url_1: "https://866187.smushcdn.com/1921598/wp-content/uploads/dachshund1.jpg?lossy=1&strip=1&webp=1",
                   photo_url_2: "https://c8.alamy.com/comp/2E93031/dachshund-dog-2E93031.jpg",
                   photo_url_3: nil,
                   good_with_kids: [true, false].sample,
                   good_with_animals: [true, false].sample)
@pet_7 = Pet.create(id: 7,
                   user_id: @user_3.id,
                   name: Faker::Creature::Dog.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 0,
                   breed: nil,
                   description: "This snake needs a big terrarium!",
                   gender: 'male',
                   fixed: nil,
                   house_trained: nil,
                   photo_url_1: "https://vermont.momcollective.com/wp-content/uploads/2020/08/snake-5-scaled.jpg",
                   photo_url_2: nil,
                   photo_url_3: nil,
                   good_with_kids: nil,
                   good_with_animals: nil)
@pet_8 = Pet.create(id: 8,
                   user_id: @user_3.id,
                   name: Faker::Creature::Dog.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 0,
                   breed: nil,
                   description: "She is a leopard gecko",
                   gender: 'female',
                   fixed: nil,
                   house_trained: nil,
                   photo_url_1: "https://diak46rl5chc7.cloudfront.net/orgs/124467/contents/a3c4nycl5evuwnpo/a3c4nycl5evuwnpo.jpg",
                   photo_url_2: "https://i.pinimg.com/736x/59/f5/82/59f5829b85bcf42bdc1eabae30238f0e--funny-lizards-leopard-geckos.jpg",
                   photo_url_3: "http://hundredsofhilariouspics.com/wp-content/uploads/2012/04/happygecko.jpg",
                   good_with_kids: nil,
                   good_with_animals: nil)
@pet_9 = Pet.create(id: 9,
                   user_id: @user_4.id,
                   name: Faker::Creature::Dog.name,
                   age: 1,
                   pet_type: 1,
                   breed: "Golden Retriever",
                   description: "This little one needs lots of chew toys!",
                   gender: Faker::Creature::Dog.gender,
                   fixed: [true, false].sample,
                   house_trained: [true, false].sample,
                   photo_url_1: "https://i.ytimg.com/vi/Stj67D1VLvo/maxresdefault.jpg",
                   photo_url_2: "https://www.thesprucepets.com/thmb/-4jMGiuVcfrGyPZutbZPXwQVH64=/1884x1413/smart/filters:no_upscale()/GoldenPuppy185743593-56a9c1f23df78cf772aa4a33.jpg",
                   photo_url_3: "https://www.reliablepups.4everhomess.com/wp-content/uploads/2019/07/4955303_large-resize.jpg",
                   good_with_kids: [true, false].sample,
                   good_with_animals: [true, false].sample)
@pet_10 = Pet.create(id: 10,
                   user_id: @user_4.id,
                   name: Faker::Creature::Dog.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 0,
                   breed: nil,
                   description: "This parakeet loves to sing!",
                   gender: 'female',
                   fixed: nil,
                   house_trained: nil,
                   photo_url_1: "https://i.ytimg.com/vi/l8Am-dp_iCs/maxresdefault.jpg",
                   photo_url_2: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Melopsittacus_undulatus_-Atlanta_Zoo%2C_Georgia%2C_USA-8a-2c.jpg/220px-Melopsittacus_undulatus_-Atlanta_Zoo%2C_Georgia%2C_USA-8a-2c.jpg",
                   photo_url_3: nil,
                   good_with_kids: nil,
                   good_with_animals: nil)
@pet_11 = Pet.create(id: 11,
                   user_id: @user_5.id,
                   name: Faker::Creature::Cat.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 2,
                   breed: "Bombay",
                   description: "Loves to catch mice!",
                   gender: 'male',
                   fixed: [true, false].sample,
                   house_trained: [true, false].sample,
                   photo_url_1: "https://www.thesprucepets.com/thmb/mnQh4QB3JmRmck_Ky3Pzo66Jp24=/3744x3744/smart/filters:no_upscale()/bombay-cat-black-cat-584192512-5808f21c3df78c2c730fe3c1.jpg",
                   photo_url_2: "https://www.catsincare.com/wp-content/uploads/2017/07/bombay1.jpg",
                   photo_url_3: "https://i.pinimg.com/originals/7d/dd/3c/7ddd3c023b184b03aed5bda3dadb461b.jpg",
                   good_with_kids: [true, false].sample,
                   good_with_animals: [true, false].sample)
@pet_12 = Pet.create(id: 12,
                   user_id: @user_6.id,
                   name: Faker::Creature::Dog.name,
                   age: [1, 2, 3, 4, 5, 6].sample,
                   pet_type: 1,
                   breed: "German Shepherd",
                   description: "Loves to go on walks!",
                   gender: Faker::Creature::Dog.gender,
                   fixed: [true, false].sample,
                   house_trained: [true, false].sample,
                   photo_url_1: "https://images.ctfassets.net/440y9b545yd9/53KkmFPEBEsbxCzTDjrDmm/5bccce4f47e5f1c68ae1dabdd8db1293/German-Shepherd850.jpg",
                   photo_url_2: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2021/01/06191159/German-Shepherd-Dog-head-portrait-indoors-500x486.jpeg",
                   photo_url_3: nil,
                   good_with_kids: [true, false].sample,
                   good_with_animals: [true, false].sample)

@favorite_1 = Favorite.create(id: 1,
                              user_id: @user_1.id,
                              pet_id: @pet_4.id)
@favorite_2 = Favorite.create(id: 2,
                              user_id: @user_2.id,
                              pet_id: @pet_7.id)
@favorite_3 = Favorite.create(id: 3,
                              user_id: @user_2.id,
                              pet_id: @pet_9.id)
@favorite_4 = Favorite.create(id: 4,
                              user_id: @user_3.id,
                              pet_id: @pet_1.id)
@favorite_5 = Favorite.create(id: 5,
                              user_id: @user_3.id,
                              pet_id: @pet_2.id)
@favorite_6 = Favorite.create(id: 6,
                              user_id: @user_4.id,
                              pet_id: @pet_1.id)
@favorite_7 = Favorite.create(id: 7,
                              user_id: @user_7.id,
                              pet_id: @pet_12.id)

@app_1 = Application.create(id: 1,
                            user_id: @user_1.id,
                            pet_id: @pet_4.id,
                            pet_name: @pet_4.name,
                            status: 0,
                            description: "I would be a great pet owner!")
@app_2 = Application.create(id: 2,
                            user_id: @user_2.id,
                            pet_id: @pet_7.id,
                            pet_name: @pet_7.id,
                            status: 1,
                            description: "I really want this pet!")
@app_3 = Application.create(id: 3,
                            user_id: @user_2.id,
                            pet_id: @pet_9.id,
                            pet_name: @pet_9.name,
                            status: 2,
                            description: "I have a big yard!")
@app_4 = Application.create(id: 4,
                            user_id: @user_3.id,
                            pet_id: @pet_1.id,
                            pet_name: @pet_1.name,
                            status: 0,
                            description: "I would love this dog so much!")
@app_5 = Application.create(id: 5,
                            user_id: @user_4.id,
                            pet_id: @pet_1.id,
                            pet_name: @pet_1.name,
                            status: 0,
                            description: "My kids would love to have this dog!")
@app_6 = Application.create(id: 6,
                            user_id: @user_5.id,
                            pet_id: @pet_8.id,
                            pet_name: @pet_8.name,
                            status: 2,
                            description: "I've always wanted a gecko!")

puts 'Seeding complete!'
