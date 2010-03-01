class IssueNotesController < ActionController::Base
	layout "standard", :except => [:ajax_method, :more_ajax, :another_ajax]
	def show
		if(User.current.active?)
			@note = IssueNote.find(:first, :conditions => ["author_id = ? AND issue_id = ?", User.current.id, params[:id]])
			if(@note.nil? or @note == 0)
				@note = IssueNote.new()
				@note.author_id = User.current.id
				@note.issue_id = params[:id]
				@note.save()
			end
		end
		render :partial => "edit", :locals => { :issue_id => params[:id] }
	end
	def save
		@note = IssueNote.find(:first, :conditions => ["author_id = ? AND issue_id = ?", User.current.id, params[:id]])
		if(@note.nil? or @note == 0)
			@note = IssueNote.new()
			@note.author_id = User.current.id
			@note.issue_id = params[:id]
		end
		@note.attributes = params[:note]
		@note.save()
		render :partial => "edit", :locals => { :issue_id => params[:id] }
	end
end

