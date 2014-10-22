require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'journal_hook'
  require_dependency 'issue_hook'
  require_dependency 'auto_completes_controller_patch'
  unless Redmine::WikiFormatting::Textile::Formatter.included_modules.include? MentionedNameFormatter
    Redmine::WikiFormatting::Textile::Formatter.send(:include, MentionedNameFormatter)
  end
end

Redmine::Plugin.register :redmine_mention_plugin do
  name 'Redmine Mention Plugin'
  author 'Florian Latzel'
  description 'Add user to watcher list after mentioning him/her (e.g. @john or @jhon.who) in issue note, Usernames are substituded with their real name and linked to their people page(redmine_people) with corresponding contact informations.'
  version '0.3'
  url 'https://github.com/fl3a/redmine-mention-plugin'
  requires_redmine :version_or_higher => '2.0.0'
  author_url 'http://netzaffe.de'
end
