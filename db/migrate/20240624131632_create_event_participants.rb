class CreateEventParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :event_participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end

    add_index :event_participants, [:user_id, :event_id], unique: true
  end
end
