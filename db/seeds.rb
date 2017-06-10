ActiveRecord::Base.transaction do
  seed_user = User.where(email: 'john.doe@mail.com').first_or_create do |user|
    user.password = '123456'
    user.password_confirmation = '123456'
    user.fullname = 'John Doe'
    user.gender = 'male'
    user.document_number = '12345678-9'

    user_address = user.build_address
    user_address.country = 'Brasil'
    user_address.state = 'SP'
    user_address.city = 'São Paulo'
    user_address.neighborhood = 'Vila Prudente'
    user_address.street = 'Rua XXX'
    user_address.number = '12A'
    user_address.complement = 'apt X'
    user_address.zipcode = '01234-567'
  end

  if seed_user.password
    3.times do |n|
      organization = seed_user.organizations.build
      organization.name = "Tatser #{n}"
      organization.cnpj = '55.475.581/0001-00'
      organization.phone = '(11) 1234-5678'
      organization.service_kind = 'service'

      organization_address = organization.build_address
      organization_address.country = 'Brasil'
      organization_address.state = 'PR'
      organization_address.city = 'Curitiba'
      organization_address.neighborhood = "Russia#{n}"
      organization_address.street = 'Rua XXX'
      organization_address.number = "#{n}0R"
      organization_address.complement = "conj 100#{n}"
      organization_address.zipcode = '98765-432'

      organization.save
    end

    puts "Generated user #{seed_user.email} with password '#{seed_user.password}'
      and organizations #{seed_user.organizations.pluck(:name).join(', ')}"
  end
end
