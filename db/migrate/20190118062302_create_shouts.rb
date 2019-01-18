class CreateShouts < ActiveRecord::Migration[5.2]
  def change
    create_table :shouts do |t|
      t.string :body, null: false
      t.references :user

      t.timestamps
    end
  end
end
