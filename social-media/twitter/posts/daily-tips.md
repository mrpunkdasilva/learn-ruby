[Tip #1]
🔥 Ruby Tip: Use `tap` para debugging elegante!

array = [1, 2, 3].tap { |x| puts "Array: #{x}" }
               .map { |n| n * 2 }
               .tap { |x| puts "Depois do map: #{x}" }

#RubyTips #Programming

[Tip #2]
✨ Ruby Magic: Sabia que strings são mutáveis?

str = "hello"
str.upcase!  # Modifica a string original
puts str     # => "HELLO"

Mas use com moderação!
#RubyProgramming

[Tip #3]
🎯 Ruby OneLiner:
`(1..100).select(&:even?).sum`

Soma todos os números pares de 1 a 100!
Simples e elegante 😎

#RubyOneLiner #Coding