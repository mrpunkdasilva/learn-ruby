# Arrays e Hashes em Ruby

Arrays e Hashes são estruturas de dados fundamentais em Ruby, permitindo armazenar e organizar coleções de objetos.

## Arrays

Arrays são coleções ordenadas de objetos que podem ser acessados por índice.

### Criação de Arrays

```ruby
# Formas de criar arrays
array_vazio = []
numeros = [1, 2, 3, 4, 5]
misturado = [1, "dois", 3.0, true]
array_palavras = %w[ruby python javascript]  # => ["ruby", "python", "javascript"]
array_simbolos = %i[nome idade cidade]       # => [:nome, :idade, :cidade]

# Array com construtor
Array.new(3)        # => [nil, nil, nil]
Array.new(3, "ruby") # => ["ruby", "ruby", "ruby"]
```

### Acessando Elementos

```ruby
numeros = [1, 2, 3, 4, 5]

# Índices positivos (do início)
numeros[0]      # => 1
numeros.first   # => 1
numeros[2]      # => 3

# Índices negativos (do fim)
numeros[-1]     # => 5
numeros.last    # => 5
numeros[-2]     # => 4

# Ranges
numeros[1..3]   # => [2, 3, 4]
numeros[1...3]  # => [2, 3]
```

### Modificando Arrays

```ruby
lista = [1, 2, 3]

# Adicionando elementos
lista << 4           # => [1, 2, 3, 4]
lista.push(5)        # => [1, 2, 3, 4, 5]
lista.unshift(0)     # => [0, 1, 2, 3, 4, 5]

# Removendo elementos
lista.pop            # => 5
lista.shift          # => 0
lista.delete(2)      # Remove o elemento 2

# Modificando elementos
lista[0] = "primeiro"
```

### Métodos Úteis para Arrays

```ruby
numeros = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]

# Ordenação
numeros.sort              # => [1, 1, 2, 3, 3, 4, 5, 5, 6, 9]
numeros.sort.uniq        # => [1, 2, 3, 4, 5, 6, 9]

# Transformação
numeros.map { |n| n * 2 }  # => [6, 2, 8, 2, 10, 18, 4, 12, 10, 6]
numeros.select { |n| n > 4 } # => [5, 9, 6, 5]

# Iteração
numeros.each { |n| puts n }
numeros.each_with_index { |n, i| puts "#{i}: #{n}" }
```

## Hashes

Hashes são coleções de pares chave-valor, similares a dicionários em outras linguagens.

### Criação de Hashes

```ruby
# Diferentes sintaxes
hash1 = {}
hash2 = Hash.new
hash3 = { "nome" => "Ruby", "versao" => 3.2 }
hash4 = { nome: "Ruby", versao: 3.2 }  # Sintaxe moderna com símbolos

# Hash com valor padrão
scores = Hash.new(0)  # Valor padrão para chaves inexistentes
```

### Acessando e Modificando

```ruby
pessoa = { nome: "Alice", idade: 30, cidade: "São Paulo" }

# Acessando valores
pessoa[:nome]    # => "Alice"
pessoa.fetch(:idade)  # => 30

# Modificando valores
pessoa[:idade] = 31
pessoa[:profissao] = "Desenvolvedora"

# Removendo pares
pessoa.delete(:cidade)
```

### Métodos Úteis para Hashes

```ruby
# Iteração
pessoa.each do |chave, valor|
  puts "#{chave}: #{valor}"
end

# Chaves e valores
pessoa.keys     # => [:nome, :idade, :profissao]
pessoa.values   # => ["Alice", 31, "Desenvolvedora"]

# Transformação
pessoa.transform_values { |v| v.to_s }
pessoa.select { |k, v| v.is_a?(String) }
```

## Combinando Arrays e Hashes

### Arrays de Hashes

```ruby
usuarios = [
  { id: 1, nome: "Alice", admin: true },
  { id: 2, nome: "Bob", admin: false },
  { id: 3, nome: "Carol", admin: true }
]

# Encontrando usuários
admins = usuarios.select { |u| u[:admin] }
nomes = usuarios.map { |u| u[:nome] }
```

### Hash com Arrays

```ruby
biblioteca = {
  ficção: ["1984", "Fundação", "Neuromancer"],
  técnico: ["Clean Code", "Ruby Design Patterns"],
  poesia: ["O Corvo", "Os Lusíadas"]
}

# Manipulando a biblioteca
biblioteca[:ficção] << "Duna"
todos_livros = biblioteca.values.flatten
```

## Boas Práticas

```ruby
# Use símbolos como chaves de hash
config = {
  porta: 3000,
  host: "localhost",
  debug: true
}

# Use map ao invés de each para transformações
nomes = ["alice", "bob", "carol"]
nomes_maiusculos = nomes.map(&:upcase)

# Use select/reject para filtrar
numeros = [1, 2, 3, 4, 5, 6]
pares = numeros.select(&:even?)
impares = numeros.reject(&:even?)
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Array.html">Documentação de Array</a>
        <a href="https://ruby-doc.org/core/Hash.html">Documentação de Hash</a>
    </category>
</seealso>