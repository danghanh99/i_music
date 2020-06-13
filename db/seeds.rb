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
    song = user.songs.create!([
      category_id: category.id,
      name:  "bai hat #{x}", 
      artist: "hanh", 
      lyric: "demo", 
      mp3: File.open(Rails.root + "public/system/songs/mp3s/000/000/001/original/Anh-Nang-Cua-Anh-Cho-Em-Den-Ngay-Mai-OST-Duc-Phuc.mp3"),
      ])
    x += 1
end


User.create!(
  email: "user@gmail.com",
  #123456
  encrypted_password: "$2a$12$M5Ste9ihZNNIFKRVYwP6dOa9BJkMIA4mKPIgq4dUVExQedQiwnQkW",
  admin: false,
)