# Sintaxe Básica do Ruby

## Estrutura de um Programa Ruby

### Comentários

```ruby
# Comentário de uma linha

=begin
Este é um comentário
de múltiplas linhas
=end
```

### Declarações e Expressões

```ruby
# Cada linha geralmente representa uma expressão
nome = "Ruby"
idade = 30

# Ponto e vírgula é opcional (não recomendado)
puts "Olá"; puts "Mundo"

# Quebras de linha são significativas
resultado = 1 + 
           2 +
           3    # => 6
```

## Convenções de Nomenclatura

### Variáveis

```ruby
# Variáveis locais
nome = "João"
primeiro_nome = "Maria"

# Variáveis de instância
@nome = "João"

# Variáveis de classe
@@contador = 0

# Variáveis globais (evite usar)
$configuracao = "desenvolvimento"

# Constantes (primeira letra maiúscula)
DIAS_SEMANA = 7
PI = 3.14159
```

### Identificadores

```ruby
# Classes - CamelCase
class MinhaClasse
end

# Módulos - CamelCase
module MeuModulo
end

# Métodos - snake_case
def calcular_total
end

# Predicados (métodos que retornam boolean)
def maior_de_idade?
end

# Métodos que modificam o objeto (bang methods)
def ordenar!
end
```

## Palavras-chave e Estruturas Básicas

### Estruturas de Controle

```ruby
# if/else
if idade >= 18
  puts "Maior de idade"
else
  puts "Menor de idade"
end

# unless (if negado)
unless idade < 18
  puts "Maior de idade"
end

# case/when
case idade
when 0..12
  puts "Criança"
when 13..17
  puts "Adolescente"
else
  puts "Adulto"
end
```

### Loops

```ruby
# while
contador = 0
while contador < 5
  puts contador
  contador += 1
end

# until (while negado)
contador = 0
until contador >= 5
  puts contador
  contador += 1
end

# for
for i in 0..4
  puts i
end

# each (mais idiomático)
(0..4).each do |i|
  puts i
end
```

## Blocos, Procs e Lambdas

### Blocos

```ruby
# Bloco com chaves (uma linha)
[1, 2, 3].each { |num| puts num }

# Bloco com do/end (múltiplas linhas)
[1, 2, 3].each do |num|
  dobro = num * 2
  puts dobro
end
```

### Procs e Lambdas

```ruby
# Proc
dobrar = Proc.new { |x| x * 2 }
puts dobrar.call(5)  # => 10

# Lambda
triplicar = ->(x) { x * 3 }
puts triplicar.call(5)  # => 15
```

## Operadores

### Operadores Aritméticos

```ruby
# Básicos
soma = 5 + 3      # => 8
subtracao = 5 - 3 # => 2
produto = 5 * 3   # => 15
divisao = 5 / 3   # => 1 (divisão inteira)
divisao_float = 5.0 / 3  # => 1.6666...
modulo = 5 % 3    # => 2
exponencial = 2 ** 3  # => 8
```

### Operadores de Comparação

```ruby
# Comparações retornam true ou false
5 == 5     # => true
5 != 3     # => true
5 > 3      # => true
5 >= 5     # => true
5 < 8      # => true
5 <= 5     # => true

# Comparação combinada (spaceship operator)
5 <=> 3    # => 1  (maior)
5 <=> 5    # => 0  (igual)
3 <=> 5    # => -1 (menor)
```

### Operadores Lógicos

```ruby
# AND
true && true   # => true
true and true  # => true (baixa precedência)

# OR
false || true   # => true
false or true   # => true (baixa precedência)

# NOT
!true          # => false
not true       # => false (baixa precedência)
```

## Boas Práticas

1. Use 2 espaços para indentação (não use tabs)
2. Evite ponto e vírgula no final das linhas
3. Use snake_case para métodos e variáveis
4. Use CamelCase para classes e módulos
5. Prefira `{}` para blocos de uma linha e `do/end` para múltiplas linhas
6. Evite variáveis globais
7. Nomeie predicados com `?` no final
8. Nomeie métodos que modificam o objeto com `!` no final

## Exemplos Práticos

### Calculadora Simples

```ruby
def calculadora(a, b, operacao)
  case operacao
  when '+'
    a + b
  when '-'
    a - b
  when '*'
    a * b
  when '/'
    b.zero? ? "Divisão por zero!" : a.to_f / b
  else
    "Operação inválida"
  end
end

# Uso
puts calculadora(10, 5, '+')  # => 15
puts calculadora(10, 5, '/')  # => 2.0
```

### Manipulação de Strings

```ruby
def formatar_nome(nome)
  return "Nome inválido" if nome.nil? || nome.empty?
  
  nome
    .strip
    .split
    .map(&:capitalize)
    .join(' ')
end

# Uso
puts formatar_nome("joão da silva")  # => "João Da Silva"
puts formatar_nome("")              # => "Nome inválido"
```

<seealso>
    <category ref="external">
        <a href="https://ruby-style-guide.shopify.dev/">Guia de Estilo Ruby</a>
        <a href="https://www.ruby-lang.org/pt/documentation/">Documentação Ruby</a>
    </category>
</seealso>