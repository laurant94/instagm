25.times do 
  username = Faker::Internet::username(specifier: 5..10).gsub('/[-.éèê,;:!]/', '_')
  email= Faker::Internet::email
  password = "password"
  password_confirmation = "password"
  puts "utilisateur #{username} #{email} "

  user = User.new(username: username, email: email, password: password, 
    password_confirmation: password_confirmation)
  if user.valid?
    user.save
  end
end