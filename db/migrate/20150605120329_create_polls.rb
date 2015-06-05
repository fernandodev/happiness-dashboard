class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.references :company, index: true, foreign_key: true
      t.string :average

      t.timestamps null: false
    end
  end
end
