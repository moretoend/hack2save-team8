class AddressValidator
  def initialize(address)
    @address = address
  end

  def validate
    check_country
    check_city
    check_neighborhood
    check_street
    check_number
  end

  private

  def check_country
    set_error('country') unless @address.country
  end

  def check_city
    set_error('city') unless @address.city
  end

  def check_neighborhood
    set_error('neighborhood') unless @address.neighborhood
  end

  def check_street
    set_error('street') unless @address.street
  end

  def check_number
    set_error('number') unless @address.number
    set_error('number', 'Need to include a number') unless /\d/ =~ @address.number
  end

  def set_error(attr, message="Can't be blank")
    @address.errors[attr.to_sym] << message
  end
end
