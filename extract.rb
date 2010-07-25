require 'rubygems'
require 'pdf/reader'

class PageTextReceiver
  attr_accessor :content

  def initialize
    @content = []
  end

  # Called when page parsing starts
  def begin_page(arg = nil)
    @content << ""
  end

  # record text that is drawn on the page
  def show_text(string, *params)
    @content.last << string.strip
  end

  def show_text_new_line(string, *params)
    @content.last << "\n"
    @content.last << string.strip
  end

  # there's a few text callbacks, so make sure we process them all
  alias :super_show_text :show_text
  alias :move_to_next_line_and_show_text :show_text_new_line
  alias :set_spacing_next_line_show_text :show_text_new_line

  # this final text callback takes slightly different arguments
  def show_text_with_positioning(*params)
    params = params.first
    params.each { |str| show_text(str) if str.kind_of?(String)}
  end
end

# receiver = PageTextReceiver.new
# pdf = PDF::Reader.file("debates/session/0705.pdf", receiver)
# puts receiver.content.inspect

Dir.glob(File.join("debates", "session", "*.pdf")).each do |f|
  unless File.exists? "#{f}.txt" or f.eql? "debates/session/0903-pdf.pdf"
    puts "Processing #{f}"
    receiver = PageTextReceiver.new
    pdf = PDF::Reader.file(f, receiver)
    file = File.new("#{f}.txt", "w+")
    file.puts receiver.content.inspect
    file.close
  end
end