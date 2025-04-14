⚡ 5 Dicas de Performance em Ruby que Você Precisa Conhecer!

🔥 Otimize seu código Ruby com estas práticas:

1️⃣ Use `map` ao invés de loops tradicionais
```ruby
# Ruim
result = []
array.each { |x| result << x * 2 }

# Bom
result = array.map { |x| x * 2 }
```

2️⃣ Freeze strings constantes
```ruby
GREETING = "Hello, World!".freeze
```

3️⃣ Use Symbol ao invés de String para keys
```ruby
# Ruim
hash = { "name" => "Ruby", "version" => "3.2.0" }

# Bom
hash = { name: "Ruby", version: "3.2.0" }
```

📊 Benchmarks e mais dicas em:
https://punkdomus.dev/ruby/performance

#RubyOptimization #Performance #Coding #PunkDomus