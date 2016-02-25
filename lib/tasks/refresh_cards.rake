task refresh_cards: :environment do
  puts 'Refreshing cards started'
  heroes = Hash[Hero.all.to_a.map{|hero| [hero.code, hero] }]
  I18n.available_locales[-3..-1].each do |locale|
    print "Starting locale %s .." % locale
    hearth_api = HearthApi.new(locale)
    hearth_api.cards.each do |card_attrs, i|
      print '.'
      card = Card.find_or_create_by(card_id: card_attrs['cardId'])
      card.update({
        rarity: card_attrs['rarity'].downcase,
        hero: heroes[card_attrs['playerClass'].to_s.downcase],
        title: card_attrs['name'],
        image_url: card_attrs['img'],
        gold_image_url: card_attrs['imgGold'],
        flavor: card_attrs['flavor'],
        text: card_attrs['text'],
        locale: locale
      })
      card.save
    end
    puts "Ended locale %s" % locale
  end
end
