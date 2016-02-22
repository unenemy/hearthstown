task refresh_cards: :environment do
  puts 'refreshing cards'
  hearth_api = HearthApi.new
  heroes = Hash[Hero.all.to_a.map{|hero| [hero.code, hero] }]
  puts "Cards count: #{hearth_api.cards.count}"
  hearth_api.cards.each_with_index do |card_attrs, i|
    puts "Dealing with card ##{i}"
    Card.find_or_create_by(card_id: card_attrs['cardId']) do |card|
      card.rarity = card_attrs['rarity'].downcase
      card.hero = heroes[card_attrs['playerClass'].to_s.downcase]
      card.title = card_attrs['name']
      card.image_url = card_attrs['img']
      card.gold_image_url = card_attrs['imgGold']
    end
  end
end
