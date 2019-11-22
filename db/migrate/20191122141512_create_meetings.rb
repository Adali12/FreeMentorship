class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :question
      t.string :meetingEmail
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
