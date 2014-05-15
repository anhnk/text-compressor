class ArchivalDocument
  attr_reader :title, :author

  def initialize(title, author,  path)
    @title = title
    @author = author
    @path = path
  end

  def content
    @content ||= File.read( @path )
  end
end

class BlockBasedArchivalDocument
  attr_reader :title, :author

  def initialize( title, author, &block )
    @title = title
    @author = author
    @initializer_block = block
  end

  def content
    if @initializer_block
      @content = @initializer_block.call
      @initializer_block = nil
    end
    @content
  end
end

file_doc = BlockBasedArchivalDocument.new( 'file', 'russ' ) do
  File.read( 'some_text.txt' )
end

google_doc = BlockBasedArchivalDocument.new( 'http', 'russ' ) do
  Net::HTTP.get_response('www.google.com', '/index.html').body
end

boring_doc = BlockBasedArchivalDocument.new( 'silly', 'russ' ) do
  'Ya' * 100
end
