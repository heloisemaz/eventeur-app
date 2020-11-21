class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.string :message, null: false
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
