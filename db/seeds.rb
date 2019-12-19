user = User.create!(
    fullname: "Johnedel Mapa",
    email: "johnedel.mapa@sun-asterisk.com",
    password: "password",
    password_confirmation: "password"
  )
  
  user.skip_confirmation!
  user.save
  
  
  50.times do |n|
    users = User.new(
    fullname: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )
  users.skip_confirmation!
  users.save!
  end