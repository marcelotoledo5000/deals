class DealsService
  def self.set_default_time
    (Time.zone.today + 30.days).strftime('%d/%m/%Y')
  end
end
