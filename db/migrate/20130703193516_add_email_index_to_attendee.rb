class AddEmailIndexToAttendee < ActiveRecord::Migration[5.2]
  def change
  	add_index :attendees, :email
  end
end
