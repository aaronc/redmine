class AddIssueNotes < ActiveRecord::Migration
	def self.up
		create_table "issue_notes", :force => true do |t|
			t.column "issue_id", :integer, :default => 0, :null => false
			t.column "author_id", :integer, :default => 0, :null => false
			t.column "note", :text
			t.column "updated_at", :timestamp
		end 
	end

	def self.down
		drop_table :issue_notes
	end
end
