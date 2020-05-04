class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :name
      t.text :text
      t.string :img
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
