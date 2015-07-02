class CreatePollMembers < ActiveRecord::Migration
  def change
    create_table :poll_members do |t|
      t.references :poll, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
