module ApplicationHelper
	def urls_to_images(s)
		s.gsub! /\s(http:\/\/.*?(\.(png|jpg)))(\s|\Z)/, '<p><img src="\1"/></p>'
		s.html_safe
	end

	def urls_to_links(s)
		s.gsub! /\s(http:\/\/.*?)(\s|\Z)/, '<a href="\1">\1</a>'
		s.html_safe		
	end
end
