class HearthApi
  URL = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/qualities/QUALITY?collectible=1"
  AUTH_HEADER = { "X-Mashape-Key" => "rP6KP3hAlNmshKiCmf0D53xGJzuvp16rJ8PjsnUE70GNHW9K07" }
  LOCALES = [ "deDE", "enGB", "enUS", "esES", "esMX", "frFR", "itIT", "koKR", "plPL", "ptBR", "ruRU", "zhCN", "zhTW", "jaJP" ]
  QUALITIES = ['Common', 'Rare', 'Epic', 'Legendary']

  attr_accessor :cards

  def initialize
    @cards = []
    collect_cards
  end

  def collect_cards
    QUALITIES.each do |quality|
      @cards += cards_by_quality(quality)
    end
  end

  def cards_by_quality(quality)
    url = URL.gsub('QUALITY', quality)
    response = HTTParty.get(url, headers: AUTH_HEADER).to_a
  end

  def cards_for_locale(locale)
  end
end