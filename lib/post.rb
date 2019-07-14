require 'open-uri'
require 'nokogiri'

class Post
  attr_reader :link, :title, :author, :content, :path
  def initialize(path)
    @path = path
    @link = "https://www.freecodecamp.org/news/#{path}"
    @title = ''
    @author = ''
    @content = []
    @status = false
  end

  def read?
    @status
  end

  def mark_read!
    @status = true
  end

  def scrape_post
    # TODO: return an array of Antiques found of Craiglist for this 'city'.
    html_content = open(@link).read
    doc = Nokogiri::HTML(html_content)
    scrape_title(doc)
    scrape_author(doc)
    scrape_content(doc)
  end

  def scrape_title(doc)
    doc.search('.post-full-title').each do |element|
      @title = element.text.strip
    end
  end

  def scrape_author(doc)
    doc.search('.author-card-name').each do |element|
      @author = element.text.strip
    end
  end

  def scrape_content(doc)
    doc.search('.post-content h1, h2, h3, h4, h5, h6, p, ul').each do |element|
      @content << element.text.strip
    end
  end
end
