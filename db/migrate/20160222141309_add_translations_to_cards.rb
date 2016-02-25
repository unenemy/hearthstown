class AddTranslationsToCards < ActiveRecord::Migration
  def up
    Card.add_translation_fields! flavor: :text, text: :text
  end

  def down
    remove_column :card_translations, :flavor
    remove_column :card_translations, :text
  end
end
