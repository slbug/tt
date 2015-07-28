class CreatePages < ActiveRecord::Migration
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :pages do |t|
      t.string :title
      t.text :content
      t.hstore :styles
      t.string :font

      t.timestamps null: false
    end
  end
end
