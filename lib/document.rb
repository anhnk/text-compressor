class Document

  @default_font = :times

  class << self
    attr_accessor :default_font
  end

  def initialize(title, author)
    @title = title
    @author = author
    @font = Document.default_font
  end

end

class Presentation < Document

  @default_font = :nimbus

  class << self
    attr_accessor :default_font
  end

  def initialize(title, author)
    @title = title
    @author = author
    @font = Presentation.default_font
  end

end
