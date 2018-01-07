@expression = gets.chomp

def compute(op, n1, n2)
    n1 = n1.to_i
    n2 = n2.to_i
    case op
    when '+'
        return n1 + n2
    when '-'
        return n1 - n2
    when '*'
        return n1 * n2
    when '/'
        return n1 / n2
    end
end

left_expr, right_expr = @expression.split(" = ")
arr_q = @expression.scan(/\?/)

if arr_q == nil
    puts(@expression)
    Process.exit(0)
end

max_combination = (10 ** arr_q.length) - 1
for x in 0..max_combination do
    str_comb = sprintf("%0"+arr_q.length.to_s+"d", x)

    t_str = left_expr
    arr_comb = str_comb.chars
    arr_q.to_a.each_with_index { |v, i| t_str = t_str.sub(v, arr_comb[i]) }
    
    arr_val = t_str.scan(/\d+/)

    left_val = arr_val[0].to_i

    left_expr
        .scan(/\+|-|\*|\//)
        .each_with_index { | op, i | left_val = compute(op, left_val, arr_val[i+1]) }

    if left_val == right_expr.to_i
        puts(t_str + ' = ' + right_expr)
        break
    end
end
