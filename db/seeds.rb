User.destroy_all
Room.destroy_all
Message.destroy_all
Chat.destroy_all

# In order to attach a png file with ActiveStorage, I had to remove the column, avatar, from the users table
betty = User.create!({username: 'betty', password: 'password'})
harold = User.create!({username: 'harold', password: 'password'})

cats = Room.create(name: 'Cat Lovers', description: 'Chat for People that LOVE CATS!')
trek = Room.create(name: 'Trekkies', description: "Chat for Weirdos")
cons = Room.create(name: 'Conspiracy Theorists', description: "Chat for People that think they are smarter than they actually are!")

Message.create(user_id: betty.id, room_id: cats.id, content: 'Mr. Whiskers is my best friend. He just gets me.')
Message.create(user_id: harold.id, room_id: cats.id, content: 'People are jerks. Cats are awesome.')

Chat.create(user_id: betty.id,room_id: cats.id)
Chat.create(user_id: harold.id,room_id: cats.id)
Chat.create(user_id: harold.id,room_id: trek.id)
Chat.create(user_id: betty.id,room_id: trek.id)
Chat.create(user_id: betty.id,room_id: cons.id)