# Operadores em Ruby

Ruby oferece uma rica variedade de operadores que permitem realizar operações matemáticas, comparações, atribuições e operações lógicas.

## Operadores Aritméticos

```ruby
# Operações básicas
soma = 5 + 3        # => 8
subtracao = 10 - 4  # => 6
produto = 4 * 3     # => 12
divisao = 15 / 2    # => 7 (divisão inteira)
modulo = 15 % 4     # => 3
exponencial = 2 ** 3 # => 8

# Divisão com ponto flutuante
divisao_float = 15.0 / 2  # => 7.5
divisao_float = 15.fdiv(2) # => 7.5
```

## Operadores de Atribuição

```ruby
# Atribuição simples
x = 5

# Atribuição com operação
x += 3   # x = x + 3
x -= 2   # x = x - 2
x *= 4   # x = x * 4
x /= 2   # x = x / 2
x **= 2  # x = x ** 2
x %= 3   # x = x % 3

# Atribuição paralela
a, b = 1, 2
x, y = y, x  # Troca de valores
```

## Operadores de Comparação

```ruby
# Igualdade e diferença
5 == 5    # => true
5 != 3    # => true
5 <=> 5   # => 0 (spaceship operator)

# Maior e menor
5 > 3     # => true
5 >= 5    # => true
3 < 5     # => true
3 <= 5    # => true

# Comparação de identidade
a.equal?(b)    # Compara se são o mesmo objeto
"ruby" === String  # => false
String === "ruby"  # => true (case subsumption)
```

## Operadores Lógicos

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

# Combinações
(1 < 2) && (2 < 3)  # => true
```

## Operadores de Range

```ruby
# Range inclusivo
1..5   # inclui 1, 2, 3, 4, 5

# Range exclusivo
1...5  # inclui 1, 2, 3, 4

# Uso com strings
'a'..'d'  # => 'a', 'b', 'c', 'd'
```

## Operadores Bit a Bit

```ruby
# AND bit a bit
5 & 3   # => 1

# OR bit a bit
5 | 3   # => 7

# XOR bit a bit
5 ^ 3   # => 6

# Deslocamento à esquerda
5 << 1  # => 10

# Deslocamento à direita
5 >> 1  # => 2
```

## Operadores Especiais

```ruby
# Operador ternário
idade >= 18 ? "Maior" : "Menor"

# Operador de segurança nula
usuario&.nome  # Retorna nil se usuario for nil

# Operador de coalescência nula
nome = nil
nome ||= "Anônimo"  # Atribui "Anônimo" se nome for nil
```

## Boas Práticas

```ruby
# Use && e || em vez de and e or para lógica
if usuario && usuario.ativo?
  # código aqui
end

# Prefira operador ternário para condições simples
status = idade >= 18 ? "Maior" : "Menor"

# Use operador de segurança nula para evitar NoMethodError
usuario&.endereco&.cidade

# Evite comparações encadeadas sem parênteses
# Ruim
if a < b && b < c
  # código
end

# Melhor
if (a < b) && (b < c)
  # código
end
```

## Exemplos Práticos

```ruby
def calcular_desconto(valor, tipo_cliente)
  desconto = case tipo_cliente
             when :vip     then 0.2
             when :regular then 0.1
             else 0.05
             end
  
  valor * (1 - desconto)
end

def validar_idade(idade)
  return "Idade inválida" unless idade&.positive?
  idade >= 18 ? "Maior de idade" : "Menor de idade"
end

def combinar_strings(str1, str2)
  resultado = str1&.strip
  resultado = "#{resultado} #{str2}".strip if str2
  resultado ||= "Vazio"
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/doc/syntax/operators_rdoc.html">Documentação de Operadores</a>
        <a href="https://ruby-doc.org/core/doc/syntax/precedence_rdoc.html">Precedência de Operadores</a>
    </category>
</seealso>