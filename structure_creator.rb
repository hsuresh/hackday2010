class StructureCreator

  def initialize(file="0705.txt")
    @file=file
    @txt = File.read(file)
    @tokens = []
  end


  def print_region(m)
    st = @txt.index(m) - 30
    en = @txt.index(m) + m.size + 30
    puts @txt[st..en]
  end

  def tokenize
    @txt.scan(/\d\d.\d+\shrs/) do |m|
      print_region(m)
      should_split = gets
      should_split.strip!
      if should_split.downcase.eql? 'y'
        unless @start.nil?
          en = @txt.index m
          token = @txt[@start..en]
          @tokens << token
          @start = en
        end
      elsif should_split.downcase.eql? 's'
        @start = @txt.index(m)
        puts "Started"
      end
    end
    
    print_tokens 
  end

  def print_tokens
    f = File.new("#{@file}.dat", "w+")
    @tokens.each do |tk|
      f.puts tk
      f.puts "[[[[[]]]]]"
    end
    f.close
  end
end

s = StructureCreator.new
s.tokenize