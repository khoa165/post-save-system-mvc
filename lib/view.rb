class View
  def display_all_titles(posts)
    puts '-----------------------------------------'
    posts.each_with_index do |post, index|
      post_info = "#{index + 1}. "
      post_info += post.read? ? '[X]' : '[]'
      post_info += " - #{post.title} (#{post.author})"
      puts post_info
    end
    puts '-----------------------------------------'
  end

  def ask_path
    puts 'Please provide path to the post you want to add!'
    gets.chomp
  end

  def ask_post_index_to_read
    puts 'What is the index of post you want to read?'
    gets.chomp.to_i - 1
  end

  def ask_post_index_to_mark
    puts 'What is the index of post you want to mark?'
    gets.chomp.to_i - 1
  end

  def display_post(posts, post_index)
    puts '-------------------------------------------------------------------------'
    puts posts[post_index].title.upcase
    puts "--- #{posts[post_index].author} ---"
    posts[post_index].content.each do |element|
      puts "#{element}\n"
    end
    puts '-------------------------------------------------------------------------'
  end
end
