User.destroy_all
Room.destroy_all
Message.destroy_all
Chat.destroy_all

# In order to attach a png file with ActiveStorage, I had to remove the column, avatar, from the users table
will = User.create!({username: 'Will', password: '123'})
mohamed = User.create!({username: 'Mohamed', password: '123'})
brandon = User.create!({username: 'Brandon', password: '123'})
fg = Room.create(name: 'Flatiron Dropouts', description: 'Cohort: 13122!')
rats = Room.create(name: 'NYC SEWER RATS', description: "Come say hi at the 34st F line")
cats = Room.create(name: 'Cat lovers', description: "Chat for people that love cats")


Message.create(user_id: will.id, room_id: cats.id, sender_name: will.username, content: 'People are jerks. Cats are awesome.')
Message.create(user_id: brandon.id, room_id: fg.id, sender_name: brandon.username, content: 'Congrats! on completing Phase 4')
Message.create(user_id: will.id, room_id: fg.id, sender_name: will.username, content: '🎉')
Message.create(user_id: mohamed.id, room_id: fg.id, sender_name: mohamed.username, content: '🎉')

Chat.create(user_id: will.id,room_id: fg.id)
Chat.create(user_id: brandon.id,room_id: fg.id)
Chat.create(user_id: mohamed.id,room_id: fg.id)
Chat.create(user_id: mohamed.id,room_id: rats.id)
Chat.create(user_id: will.id,room_id: rats.id)
Chat.create(user_id: will.id,room_id: cats.id)