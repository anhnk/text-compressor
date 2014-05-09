class Document
  attr_accessor :writable
  attr_reader :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def title=( new_title )
    if @writable
      @title = new_title
    end
  end

  def add_authors( *names )
    @author += " #{names.join(' ')}"
  end

  def average_word_length
    total = words.inject(0.0){ |result, word| word.size + result }
    total / word_count
  end

  def obscure_times!
    @content.gsub!( /\d\d:\d\d (AM|PM)/, '**:** **' )
  end

  def about_me
    puts "I am #{self}"
    puts "My title is #{self.title}"
    puts "I have #{self.word_count} words"
  end

  def prose_rating
    return :really_pretentious if really_pretentious?
    return :somewhat_pretentious if somewhat_pretentious?
    return :really_informal if really_informal?
    return :somewhat_informal if somewhat_informal?
    return :about_right
  end

  def really_pretentious?
    pretentious_density > 0.3 && informal_density < 0.2
  end

  def somewhat_pretentious?
    pretentious_density > 0.3 && informal_density >= 0.2
  end

  def really_informal?
    pretentious_density < 0.1 && informal_density > 0.3
  end

  def really_pretentious?
    pretentious_density < 0.1 && informal_density <= 0.3
  end

  def pretentions_density
    # Somehow compute density of pretentious words
  end

  def informal_density
    # Somehow compute density of informal words
  end

  def word_count
    words.size
  end

  def +(other)
    if other.kind_of?(String)
      return Document.new( title, author, "#{content} #{other}" )
    end
    Document.new( title, author, "#{content} #{other.content}" )
  end

  def !
    Document.new( title, author, "It is not true: #{content}"  )
  end

  def +@
    Document.new( title, author, "I am sure that #{@content}" )
  end

  def -@
    Document.new( title, author, "I doubt that #{@content}" )
  end

  def [](index)
    words[index]
  end

  private :word_count

end
