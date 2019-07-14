require 'csv'

class Storage
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @posts = []
    parse_csv
  end

  def all_posts
    @posts
  end

  def add_post(new_post)
    @posts << new_post
    store_to_csv
  end

  def mark_post(post_index)
    @posts[post_index].mark_read!
  end

  def parse_csv
    CSV.foreach(@csv_file_path) do |row|
      new_post = Post.new(row[0])
      # new_post.scrape_post
      @posts << new_post
    end
  end

  def store_to_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @posts.each do |post|
        csv << [post.path, post.author]
      end
    end
  end
end
