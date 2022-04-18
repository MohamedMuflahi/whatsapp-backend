User.destroy_all
Room.destroy_all
Message.destroy_all

# In order to attach a png file with ActiveStorage, I had to remove the column, avatar, from the users table
betty = User.create!({username: 'betty', password: 'password'})
harold = User.create!({username: 'harold', password: 'password'})

cats = Room.create(name: 'Cat Lovers', description: 'This chatroom is for anyone who loves cats... anyone who understands that cats are superior to dogs in every way... anyone who would have 20 cats if their housemate/significant other would allow it... anyone who actually DOES have 20 cats.')
trek = Room.create(name: 'Trekkies', description: "Do you speak Klingon? Do you enjoy a good debate surrounding the tenets of Star Fleet's Prime Directive? Do you have a signed autography from Wil Wheaton (a.k.a. Ensign Wesley Crusher)? If you answered 'yes' to any of these questions then this chatroom is for you!")
cons = Room.create(name: 'Conspiracy Theorists', description: "We all know that THE MAN controls the media, we all know that THE MAN has poisoned the water... and our brains. We all know that THE MAN is attempting to surround us in HIS VERSION of reality. If you want to open your eyes and fight the deception all around us, then this chatroom is for you. Please be advised - it is highly recommended that you DO NOT USE your real name when joining this channel!")

Message.create(user_id: betty.id, room_id: cats.id, content: 'Mr. Whiskers is my best friend. He just gets me.')
Message.create(user_id: harold.id, room_id: cats.id, content: 'People are jerks. Cats are awesome.')

Chat.create(user_id: betty.id,room_id: cats.id)
Chat.create(user_id: harold.id,room_id: cats.id)
Chat.create(user_id: harold.id,room_id: trek.id)
Chat.create(user_id: betty.id,room_id: trek.id)
Chat.create(user_id: betty.id,room_id: cons.id)