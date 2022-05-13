module Robogrid
    class Grid
      attr_reader :width, :height
  
      def initialize(params={})
        default_size = 6
        @width  = params[:width] || default_size
        @height = params[:height] || default_size
      end
  
    end
  end
  