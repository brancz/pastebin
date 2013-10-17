module PastesHelper
	def createdAgoByUser(paste)
		str = time_ago_in_words(paste.created_at, include_seconds: true) + 
      " ago by "
    if paste.user_id != nil
      str += User.find(paste.user_id).name
    else
      str += "Anonymous"
    end
    str
	end

  def editPasteLink(paste)
    link_to '', edit_paste_path(paste), :class => "glyphicon glyphicon-edit"
  end

  def deletePasteLink(paste)
    link_to '', paste, method: :delete, data: { confirm: 'Are you sure?' }, :class => "glyphicon glyphicon-remove" 
  end
end
