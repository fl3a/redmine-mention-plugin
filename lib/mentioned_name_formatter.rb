require_dependency "redmine/wiki_formatting/textile/formatter"

module MentionedNameFormatter
  Redmine::WikiFormatting::Textile::Formatter::RULES << :inline_mentioned_name

  private
  
  def inline_mentioned_name(text)
    baseurl = Redmine::Utils.relative_url_root

    mentioned_users = text.scan(/@[\w.]+/)
    mentioned_users.each do |mentioned_user|
      username = mentioned_user[1..-1] # Remove the heading ':'
      if user = User.find_by_login(username)
        text.gsub!(mentioned_user, "<a href=\"#{baseurl}/people/#{user.id}\">#{user.name}</a>")
      end
    end
  end
end
