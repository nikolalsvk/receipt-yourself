class BanksController < ApplicationController

  def receive_data
    @basic_info = params[:basicInfo]
    @contact_info = params[:contactInfo]

    @bank = Bank.new
    @contact_card = ContactCard.new

    @bank.contact_card = @contact_card
    @bank.from_json(@basic_info)
    @contact_card.from_json(@contact_info)

    @contact_card.save!
    @bank.save!
  end

end
