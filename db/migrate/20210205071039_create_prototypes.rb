class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :name
      t.string :title
      t.text :concept
      t.text :image
      t.text :catch_copy
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
