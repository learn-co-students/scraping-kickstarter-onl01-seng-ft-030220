# require libraries/modules here
require 'open-uri'
require "nokogiri"
require "pry"

def create_project_hash
  # write your code here
  
  html = File.read('fixtures/kickstarter.html')
  
  kickstarter = Nokogiri::HTML(html)
  
  project_hash = {} # return variable 
  
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text.strip
    #binding.pry
    project_hash[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value, 
      :description => project.css("p.bbcard_blurb").text.strip, 
      :location => project.css(".location-name").text.strip, 
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.strip.gsub("%", "").to_i
    }
  end
  
  project_hash
end

create_project_hash

# projects: kickstarter.css("li.project.grid_4")

# title: project.css("h2.bbcard_name strong a").text

# description: project.css("p.bbcard_blurb").text.strip

# image_link: project.css("div.project-thumbnail a img").attribute("src).value

# location: project.css(".location-name").text.strip

# percent_funded: project.css("ul.project-stats li.first.funded strong").text.strip.gsub("%", "").to_i

