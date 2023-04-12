# The following is my solution to the extension problem. This program will take a string of any length and a custom width. 
# It will then format the string into a banner with pleasant padding. The max width in coderpad that didn't result in a breakdown in format was 69, 
# so that is the widest width acceptable. Any input greater will result in a max width of 69. Also, if the user selected width is less than the largest word, 
# the program will auto assign the width to the smallest size that won't deteriorate the format. Default width is 40 if user provides no width.

class Banner
  def initialize(message, width=40)
    min_width = message.split(' ').sort_by { |e| e.size}.pop.size
    @message = message
    if width < min_width
      @width = min_width
    elsif width > 69
      @width = 69
    else
      @width = width
    end
  end

  def print_banner
    lines = message_line
    puts horizontal_rule
    puts empty_line
    lines.each do |line|
      puts "| " + line.center(@width) + " |"
    end
    puts empty_line
    puts horizontal_rule
  end

  private

  def horizontal_rule
    '+' + '-' * (@width + 2) + '+'
  end

  def empty_line
    '|' + ' ' * (@width + 2) + '|'
  end

  def message_line
    words = @message.split(' ')
    lines = []
    line_builder = []
    next_word = ''
    words.each do |word|
      line_builder << word
      if line_builder.join(' ').size > @width
        next_word = line_builder.pop
        lines << line_builder.join(' ')
        line_builder = []
        line_builder << next_word
      end
    end
    if line_builder.empty? == false
      lines << line_builder.join(' ')
    end
    lines
  end

end

banner = Banner.new('Is this the real life, or is this just fantasy? Caught in a landslide. No escape from reality.', 90)
banner.print_banner