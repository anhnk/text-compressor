module WordProcessor

  def self.points_to_inches( points )
    points / 72.0
  end

  def self.inches_to_points( inches )
    inches * 72.0
  end

  module Rendering
    class Font
      attr_accessor :name, :weight, :PaperSize

      def initialize( name, weight=:normal, size=10 )
        @name = name
        @weight = weight
        @size = size
      end
    end

    class PaperSize
      attr_accessor :name, :width, :height

      def initialize( name='US Let', width=8.5, height=11.0 )
        @name = name
        @width = width
        @height = height
      end
    end

    DEFAULT_FONT = Font.new( 'default' )
    DEFAULT_PAPER_SIZE = PaperSize.new
  end
end
