class CreateShortLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :short_links do |t|
      t.string :long_url
      t.string :short_link

      t.timestamps
    end
  end
end
