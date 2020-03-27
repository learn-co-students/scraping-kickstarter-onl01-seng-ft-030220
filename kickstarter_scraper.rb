require 'pry'
# require libraries/modules here
require 'nokogiri'
def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
 
kickstarter = Nokogiri::HTML(html)
#binding.pry
projects = {}
 
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
 
  # return the projects hash
  projects
end


#create_project_hash

#kickstarter.css("li.project.grid_4").first
#this is for the first line 

# title: project.css("h2.bbcard_name strong a").text
#this is for title 

#project.css("div.project-thumbnail a img").attribute("src").value
#this is for the thumbnail

# project.css("p.bbcard_blurb").text
# this is for the description

#project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
#this is for the percentage and to convert it into an integer

#project.css("ul.project-meta span.location-name").text
#this is for location