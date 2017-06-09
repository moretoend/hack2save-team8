if Rails.env.development?
  seed_user = User.where(email: 'john.doe@mail.com').first_or_create do |user|
    user.password = '123456'
    user.password_confirmation = '123456'
  end

  if seed_user.password
    puts "Generated user #{seed_user.email} with password '#{seed_user.password}'"
  end
end
