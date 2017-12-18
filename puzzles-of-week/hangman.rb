@word = gets.chomp
@chars = gets.chomp

#template
@t = "+--+\n|   \n|    \n|\\   \n"

def incorrect(i)
    case i
    when 0
        @t[8] = 'o'
    when 1
        @t[13] = '|'
    when 2
        @t[12] = '/'
    when 3
        @t[14] = '\\'
    when 4
        @t[18] = '/'
    when 5
        @t[20] = '\\'
    end
end

@mask = ""
@word.each_char {|c| @mask += c==' ' ? ' ' : '_' }

def correct(s)
    @word.each_char.with_index {|c, i| if c.downcase==s.downcase then @mask[i] = c end }
end

@c = -1
@chars.split(' ').each {|s| (((@word.include? s) && !(@mask.include? s)) ? correct(s) : incorrect(@c+=1) ) }

@t = @t.split("\n").map(&:strip)
puts @t 
puts @mask