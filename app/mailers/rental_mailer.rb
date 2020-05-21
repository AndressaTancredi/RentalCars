class RentalMailer <ApplicationMailer

  # Cada método é um email diferente.

  def rental_scheduled(rental_id)
    @rental = Rental.find(rental_id)
    client = @rental.client

    mail(to: [client.email,'andressa.tancredi@hotmail.com'], subject: "Confirmação de Agendamento - #{ @rental.code }" )
  end
end