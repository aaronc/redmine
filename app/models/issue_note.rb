class IssueNote < ActiveRecord::Base
	has_one :issue
	has_one :author
end
