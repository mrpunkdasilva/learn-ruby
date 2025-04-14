💎 Ruby OneLiners que vão explodir sua mente! 🤯

[1/5]
"hello".chars.zip("world".chars)
#=> [["h","w"],["e","o"],["l","r"],["l","l"],["o","d"]]
#RubyMagic

[2/5]
(1..10).reduce(&:*)
#=> Calcula fatorial de 10!
#RubyOneLiner

[3/5]
%w[a b c].map(&:upcase).join
#=> "ABC"
#RubyTips

[4/5]
hash = Hash[(:a..:z).zip(1..26)]
#=> {a:1, b:2, ..., z:26}
#RubyHacks

[5/5]
"racecar".chars == "racecar".chars.reverse
#=> Verifica palíndromo!
#RubyCoding