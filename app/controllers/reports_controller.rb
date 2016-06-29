class ReportsController < ApplicationController

  def kif
  end

  def kuf
  end

  def partner_card
  end

  def ios
  end

  private

  def sendJSON(email, info, path)
    set_JSON_destination
    RestClient.post @rg_address + path, {:data=> {email: email, 
                                                  info: info}.to_json},
                                        {:content_type =>:json,:accept=> :json}
  end

  def set_JSON_destination
    @rg_address = if Rails.env.development?
                    "http://localhost:9292"
                  elsif Rails.env.production?
                    "https://ry-report-generator.herokuapp.com"
                  end
  end

end
