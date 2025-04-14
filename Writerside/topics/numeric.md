# Tipos Numéricos em Ruby

Ruby oferece diversos tipos numéricos para diferentes necessidades, desde cálculos simples até operações matemáticas complexas.

## Tipos Básicos

### Integers (Números Inteiros)

```ruby
# Integers podem ser de qualquer tamanho
pequeno = 42
grande = 12345678901234567890

# Diferentes bases
binario = 0b1010      # => 10
octal = 0o252         # => 170
hexadecimal = 0xAB    # => 171

# Underscore para legibilidade
milhao = 1_000_000    # => 1000000
```

### Floats (Números de Ponto Flutuante)

```ruby
# Declaração básica
pi = 3.14159
cientifico = 1.2e-3   # => 0.0012

# Precisão
resultado = 0.1 + 0.2  # => 0.30000000000000004
```

### Rational (Números Racionais)

```ruby
# Criação de números racionais
racional = Rational(3, 4)    # => (3/4)
r = 3/4r                     # Sintaxe curta

# Operações com racionais
soma = Rational(1, 2) + Rational(1, 3)  # => (5/6)
```

### Complex (Números Complexos)

```ruby
# Criação de números complexos
complexo = Complex(2, 3)     # => (2+3i)
c = 2 + 3i                   # Sintaxe curta

# Operações com complexos
modulo = complexo.abs        # => 3.605551275463989
```

## Operações Matemáticas

### Operações Básicas

```ruby
# Aritméticas fundamentais
soma = 5 + 3          # => 8
subtracao = 5 - 3     # => 2
multiplicacao = 5 * 3  # => 15
divisao = 5 / 3       # => 1 (divisão inteira)
divisao_float = 5.0 / 3  # => 1.6666666666666667
modulo = 5 % 3        # => 2
exponencial = 2 ** 3  # => 8
```

### Métodos Matemáticos

```ruby
# Métodos da classe Math
raiz = Math.sqrt(16)          # => 4.0
seno = Math.sin(Math::PI/2)   # => 1.0
log = Math.log(100, 10)       # => 2.0
```

## Conversões

```ruby
# Entre tipos numéricos
inteiro = 42
float = inteiro.to_f      # => 42.0
racional = inteiro.to_r   # => (42/1)
complexo = inteiro.to_c   # => (42+0i)

# De string para número
"123".to_i       # => 123
"3.14".to_f      # => 3.14
"0xFF".to_i(16)  # => 255
```

## Comparações e Verificações

```ruby
# Operadores de comparação
5 < 10           # => true
5 >= 5           # => true
3.14 == 3        # => false

# Verificações de tipo
42.integer?      # => true
3.14.float?      # => true
(2/3r).rational? # => true
```

## Arredondamento e Precisão

```ruby
# Métodos de arredondamento
3.14159.round(2)    # => 3.14
3.14159.ceil        # => 4
3.14159.floor       # => 3
3.14159.truncate    # => 3

# Precisão decimal
require 'bigdecimal'
BigDecimal('3.14159').round(2)  # => 3.14
```

## Exemplos Práticos

### Cálculos Financeiros

```ruby
def calcular_juros(principal, taxa, tempo)
  principal * (1 + taxa) ** tempo
end

investimento = calcular_juros(1000, 0.05, 3)
puts format("%.2f", investimento)  # => 1157.63
```

### Operações Matemáticas Complexas

```ruby
def distancia_entre_pontos(x1, y1, x2, y2)
  Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
end

dist = distancia_entre_pontos(0, 0, 3, 4)
puts dist  # => 5.0
```

### Manipulação de Precisão

```ruby
def media_com_precisao(numeros)
  soma = numeros.reduce(0, :+)
  (soma.to_f / numeros.length).round(2)
end

notas = [7.5, 8.2, 6.9, 9.3]
puts media_com_precisao(notas)  # => 7.98
```

## Boas Práticas

```ruby
# Use integers para contadores
contador = 0
contador += 1

# Use floats para cálculos científicos
velocidade = 299_792_458.0  # m/s

# Use rational para frações exatas
proporcao = Rational(1, 3)

# Use BigDecimal para cálculos financeiros
require 'bigdecimal'
valor = BigDecimal('10.99')
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Integer.html">Documentação de Integer</a>
        <a href="https://ruby-doc.org/core/Float.html">Documentação de Float</a>
        <a href="https://ruby-doc.org/core/Math.html">Documentação de Math</a>
    </category>
</seealso>