💎 Dica Ruby da Semana: Blocks, Procs e Lambdas!

Você sabe a diferença entre eles? Aqui está um guia rápido:

1️⃣ Blocks: São trechos de código anônimos
```ruby
[1, 2, 3].each { |n| puts n }
```

2️⃣ Procs: São blocks que podem ser salvos em variáveis
```ruby
square = Proc.new { |x| x**2 }
[1, 2, 3].map(&square) #=> [1, 4, 9]
```

3️⃣ Lambdas: São como Procs, mas com verificação de argumentos
```ruby
sum = ->(a, b) { a + b }
```

📚 Quer aprender mais? Confira nossa documentação completa:
https://punkdomus.dev/ruby/blocks-procs-lambdas

#Ruby #RubyTips #Programming #Coding #PunkDomus #DevDicas