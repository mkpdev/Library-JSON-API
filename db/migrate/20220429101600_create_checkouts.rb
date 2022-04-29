class CreateCheckouts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkouts do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :assigned_at
      t.datetime :return_at
      t.integer :status

      t.timestamps
    end
  end
end
