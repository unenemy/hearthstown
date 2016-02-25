class HearthApi
  URL = 'https://omgvamp-hearthstone-v1.p.mashape.com/cards/qualities/'
  LOCALES = [ 'deDE', 'enGB', 'enUS', 'esES', 'esMX', 'frFR', 'itIT', 'koKR', 'plPL', 'ptBR', 'ruRU', 'zhCN', 'zhTW', 'jaJP' ]
  QUALITIES = ['Common', 'Rare', 'Epic', 'Legendary']

  def initialize(locale='enUS')
    @locale = locale
  end

  def cards
    @cards ||= collect_cards
  end

  private
  def collect_cards
    QUALITIES.inject([]) do |result, quality|
      result += cards_by_quality(quality)
      result
    end
  end

  def cards_by_quality(quality)
    url = URL + quality
    response = HTTParty.get(url, request_options)
    if response.code == 401
      Rails.logger.error 'Hearthstone API authorization failed'
      []
    else
      response.to_a
    end
  end

  def request_options
    @request_options ||= {
      query: {
        collectible: 1,
        locale: @locale
      },
      headers: { 'X-Mashape-Key' => Rails.application.secrets.hearth_key }
    }
  end
end
