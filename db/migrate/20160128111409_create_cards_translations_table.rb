class CreateCardsTranslationsTable < ActiveRecord::Migration
  def up
    Card.create_translation_table! title: :string, image_url: :string, gold_image_url: :string
  end

  def down
    Card.drop_translation_table!
  end
end
