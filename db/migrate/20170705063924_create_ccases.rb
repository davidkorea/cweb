class CreateCcases < ActiveRecord::Migration[5.0]
  def change
    create_table :ccases do |t|
      t.string :title
      t.text :description
      t.string :device
      t.string :custname
      t.string :custsite
      t.string :custphone
      t.string :custmail
      t.text :note

      t.timestamps
    end
  end
end
