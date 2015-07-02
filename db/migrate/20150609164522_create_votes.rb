class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :poll, index: true, foreign_key: true
      t.string :token
      t.integer :value

      t.timestamps null: false
    end
  end
end
