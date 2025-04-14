# Ranges em Ruby

Ranges representam intervalos de valores em Ruby. São úteis para expressar sequências e intervalos de forma concisa.

## Tipos de Ranges

### Range Inclusivo (..)

```ruby
# Inclui o último número
intervalo = 1..5  # inclui 1, 2, 3, 4, 5
letras = 'a'..'e' # inclui 'a', 'b', 'c', 'd', 'e'

# Verificando elementos
puts intervalo.include?(3)  # => true
puts intervalo.include?(6)  # => false
```

### Range Exclusivo (...)

```ruby
# Exclui o último número
intervalo = 1...5  # inclui 1, 2, 3, 4
letras = 'a'...'e' # inclui 'a', 'b', 'c', 'd'

# Verificando elementos
puts intervalo.include?(4)  # => true
puts intervalo.include?(5)  # => false
```

## Operações com Ranges

### Conversão para Array

```ruby
# Convertendo ranges em arrays
numeros = (1..5).to_a      # => [1, 2, 3, 4, 5]
alfabeto = ('a'..'e').to_a # => ['a', 'b', 'c', 'd', 'e']

# Ranges com steps
pares = (0..10).step(2).to_a  # => [0, 2, 4, 6, 8, 10]
```

### Iteração

```ruby
# Iterando sobre ranges
(1..5).each { |n| puts n }

# Com step
(0..10).step(2) { |n| puts "Número par: #{n}" }

# Enumeração
soma = (1..100).reduce(:+)  # Soma todos os números de 1 a 100
```

## Usos Comuns

### Em Condicionais

```ruby
idade = 25

case idade
when 0..12
  puts "Criança"
when 13..17
  puts "Adolescente"
when 18..64
  puts "Adulto"
else
  puts "Idoso"
end
```

### Em Arrays

```ruby
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Slicing com ranges
primeiros = numeros[0..2]    # => [1, 2, 3]
meio = numeros[3...7]        # => [4, 5, 6, 7]
ultimos = numeros[-3..-1]    # => [8, 9, 10]
```

### Em Strings

```ruby
texto = "Ruby é incrível!"

# Substring com ranges
puts texto[0..3]     # => "Ruby"
puts texto[5..6]     # => "é"
puts texto[-9..-1]   # => "incrível!"
```

## Métodos Úteis

```ruby
range = (1..10)

# Verificações
range.begin     # => 1
range.end       # => 10
range.exclude_end?  # => false (é inclusivo)

# Operações
range.first     # => 1
range.first(3)  # => [1, 2, 3]
range.last      # => 10
range.last(3)   # => [8, 9, 10]

# Iteração reversa
range.reverse_each { |n| puts n }
```

## Ranges Infinitos

```ruby
# Range sem fim (Ruby 2.6+)
numeros = (1..)
letras = ('a'..)

# Primeiros elementos
puts numeros.first(5)  # => [1, 2, 3, 4, 5]
puts letras.first(3)   # => ["a", "b", "c"]

# Range com início infinito (Ruby 2.7+)
negativos = (..0)
puts negativos.include?(-1)  # => true
puts negativos.include?(1)   # => false
```

## Boas Práticas

```ruby
# Use ranges para intervalos numéricos
def classificar_temperatura(temp)
  case temp
  when -Float::INFINITY..0
    "Congelando"
  when 0..20
    "Frio"
  when 21..25
    "Agradável"
  when 26..35
    "Quente"
  else
    "Muito quente"
  end
end

# Use ranges para validações
def validar_idade(idade)
  (0..120).include?(idade)
end

# Use ranges para gerar sequências
def gerar_codigo
  ('A'..'Z').to_a.sample(6).join
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Range.html">Documentação de Range</a>
    </category>
</seealso>