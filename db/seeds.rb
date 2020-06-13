User.create!(
  email: "Admin@gmail.com",
  #123456
  encrypted_password: "$2a$12$M5Ste9ihZNNIFKRVYwP6dOa9BJkMIA4mKPIgq4dUVExQedQiwnQkW",
  admin: true,
)
user = User.first
x = 1
5.times do
    category = user.categories.create!(name: "category #{x}")
    2.times do
      home.rooms.create!(
        user_id: user.id,
        length: 25,
        width: 7,
        height: 5,
        area: 175,
        number_room: number_room_default,
        price: 2000000,
        price_unit: "VND",
        status: "available",
      )
      number_room_default += 1
    end

    x += 1
end

User.create!(name: "user test",
             email: "UserTest@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             phone_number: 2363842308,
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
