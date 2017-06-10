seed_user = User.where(email: 'john.doe@mail.com').first_or_create do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.fullname = 'John Doe'
  user.gender = 'male'
  user.document_number = '12345678-9'
  user.address.country = 'Brasil'
  user.address.state = 'SP'
  user.address.city = 'São Paulo'
  user.address.neighborhood = 'Vila Prudente'
  user.address.street = 'Rua XXX'
  user.address.number = '12A'
end

if seed_user.password
  puts "Generated user #{seed_user.email} with password '#{seed_user.password}'"
end
