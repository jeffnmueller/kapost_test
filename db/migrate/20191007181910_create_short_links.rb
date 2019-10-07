class CreateShortLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :short_links do |t|
      t.string :url
      t.string :short_url

      t.timestamps
    end
  end
end
