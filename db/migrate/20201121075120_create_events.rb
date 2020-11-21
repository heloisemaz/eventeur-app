class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.text :description
      t.string :email, null: false

      t.timestamps
    end
  end
end
