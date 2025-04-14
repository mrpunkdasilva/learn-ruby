# Tipos de Dados em Ruby

Ruby é uma linguagem dinamicamente tipada, o que significa que você não precisa declarar explicitamente o tipo de uma variável. O tipo é determinado pelo valor atribuído.

## Tipos Básicos

### Numbers (Números)

```ruby
# Integers (Números Inteiros)
idade = 25
ano = 2024
numero_negativo = -42

# Floats (Números Decimais)
altura = 1.75
pi = 3.14159
temperatura = -10.5

# Operações com números
soma = 10 + 5        # => 15
divisao = 10.0 / 3   # => 3.3333...
potencia = 2 ** 3    # => 8
```

### Strings (Texto)

```ruby
# Strings com aspas simples
nome = 'Ruby'

# Strings com aspas duplas (permite interpolação)
linguagem = "#{nome} é incrível!"

# Strings multilinhas
descricao = <<-TEXT
  Esta é uma string
  com múltiplas linhas
  em Ruby
TEXT

# Métodos comuns de strings
nome.upcase      # => "RUBY"
nome.downcase    # => "ruby"
nome.length      # => 4
nome.reverse     # => "ybuR"
```

### Symbols (Símbolos)

```ruby
# Símbolos são strings imutáveis, frequentemente usados como identificadores
:status
:nome
:erro_404

# Comparação de performance
"string" == "string"  # Compara dois objetos diferentes
:symbol == :symbol    # Compara o mesmo objeto
```

### Booleans (Booleanos)

```ruby
# Apenas true e false
verdadeiro = true
falso = false

# Operadores booleanos
true && false  # => false
true || false  # => true
!true          # => false

# Valores "truthy" e "falsy"
# Em Ruby, apenas false e nil são considerados falsy
# Todo o resto é truthy
```

### Nil (Nulo)

```ruby
# nil representa a ausência de valor
variavel = nil

# Verificando nil
variavel.nil?      # => true
variavel == nil    # => true
```

## Tipos de Coleção

### Arrays (Vetores)

```ruby
# Criando arrays
numeros = [1, 2, 3, 4, 5]
misturado = [1, "dois", :tres, 4.0]

# Acessando elementos
primeiro = numeros[0]     # => 1
ultimo = numeros[-1]      # => 5

# Modificando arrays
numeros << 6             # Adiciona ao final
numeros.push(7)          # Também adiciona ao final
numeros.pop              # Remove do final
numeros.shift           # Remove do início
numeros.unshift(0)      # Adiciona no início
```

### Hashes (Dicionários)

```ruby
# Criando hashes
pessoa = {
  nome: "João",
  idade: 30,
  cidade: "São Paulo"
}

# Sintaxe antiga (ainda válida)
pessoa_antiga = {
  "nome" => "João",
  "idade" => 30
}

# Acessando valores
nome = pessoa[:nome]     # => "João"
idade = pessoa[:idade]   # => 30

# Modificando hashes
pessoa[:profissao] = "Desenvolvedor"
pessoa.delete(:cidade)
```

### Ranges (Intervalos)

```ruby
# Intervalos inclusivos
numeros = 1..5          # Inclui 5 (1, 2, 3, 4, 5)

# Intervalos exclusivos
letras = 'a'...'d'      # Não inclui 'd' (a, b, c)

# Usando ranges
numeros.to_a           # => [1, 2, 3, 4, 5]
letras.include?('c')   # => true
```

## Conversão entre Tipos

```ruby
# String para Número
"123".to_i       # => 123 (inteiro)
"3.14".to_f      # => 3.14 (float)

# Número para String
123.to_s         # => "123"
3.14.to_s        # => "3.14"

# Array para String
[1, 2, 3].join(", ")  # => "1, 2, 3"

# String para Array
"a,b,c".split(",")    # => ["a", "b", "c"]
```

## Verificação de Tipos

```ruby
# Verificando o tipo de um objeto
1.class              # => Integer
"texto".class        # => String
[1, 2, 3].class     # => Array

# Verificando se um objeto é de determinado tipo
1.is_a?(Integer)     # => true
"texto".is_a?(String) # => true
```

## Exemplos Práticos

### Manipulação de Diferentes Tipos

```ruby
def processar_dado(dado)
  case dado
  when String
    "Texto: #{dado.upcase}"
  when Integer
    "Número: #{dado * 2}"
  when Array
    "Array com #{dado.length} elementos"
  else
    "Tipo não suportado: #{dado.class}"
  end
end

puts processar_dado("ruby")     # => "Texto: RUBY"
puts processar_dado(42)         # => "Número: 84"
puts processar_dado([1, 2, 3])  # => "Array com 3 elementos"
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/String.html">Documentação String</a>
        <a href="https://ruby-doc.org/core/Array.html">Documentação Array</a>
        <a href="https://ruby-doc.org/core/Hash.html">Documentação Hash</a>
    </category>
</seealso>