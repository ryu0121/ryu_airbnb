# ユーザー
User.create!(name:  "user1",
    email: "manchester.ryu.121@gmail.com",
    password:              "password",
    password_confirmation: "password",
    admin: true
    )

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password,
      )
end