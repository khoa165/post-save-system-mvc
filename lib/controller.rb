require_relative 'post'

class Controller
  def initialize(storage, view)
    @storage = storage
    @view = view
  end

  def list
    posts = @storage.all_posts
    @view.display_all_titles(posts)
  end

  def save
    post_path = @view.ask_path
    new_post = Post.new(post_path)
    new_post.scrape_post
    @storage.add_post(new_post)
  end

  def read
    posts = @storage.all_posts
    post_index = @view.ask_post_index_to_read
    @view.display_post(posts, post_index)
  end

  def mark
    post_index = @view.ask_post_index_to_mark
    @storage.mark_post(post_index)
  end
end
