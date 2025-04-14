# Closures em Ruby

Closures são blocos de código que podem capturar e carregar consigo o contexto onde foram definidos.

## Conceitos Básicos

### O que são Closures

```ruby
# Exemplo básico de closure
def criar_contador
  count = 0
  return -> { count += 1 }
end

contador = criar_contador
puts contador.call  # => 1
puts contador.call  # => 2
```

### Tipos de Closures em Ruby

```ruby
# Blocks
def executar
  yield if block_given?
end

# Procs
soma = Proc.new { |a, b| a + b }

# Lambdas
multiplicar = ->(a, b) { a * b }
```

## Diferenças entre Proc e Lambda

### Verificação de Argumentos

```ruby
# Lambda é mais estrito com argumentos
lambda_exemplo = ->(x, y) { x + y }
proc_exemplo = Proc.new { |x, y| x + y }

lambda_exemplo.call(1)      # ArgumentError
proc_exemplo.call(1)        # Retorna nil para y
```

### Comportamento do return

```ruby
def teste_lambda
  lambda = -> { return "lambda" }
  lambda.call
  return "método"
end

def teste_proc
  proc = Proc.new { return "proc" }
  proc.call
  return "método"
end

puts teste_lambda  # => "método"
puts teste_proc    # => "proc"
```

## Contexto e Escopo

### Capturando Variáveis

```ruby
def criar_saudacao(nome)
  saudacao = "Olá"
  -> { "#{saudacao}, #{nome}!" }
end

saudar = criar_saudacao("Ruby")
puts saudar.call  # => "Olá, Ruby!"
```

### Múltiplos Contextos

```ruby
def criar_multiplicador(fator)
  -> (numero) { numero * fator }
end

dobrar = criar_multiplicador(2)
triplicar = criar_multiplicador(3)

puts dobrar.call(5)     # => 10
puts triplicar.call(5)  # => 15
```

## Casos de Uso Práticos

### Callbacks

```ruby
class Button
  def initialize
    @callbacks = []
  end

  def on_click(&block)
    @callbacks << block
  end

  def click
    @callbacks.each { |callback| callback.call }
  end
end

botao = Button.new
botao.on_click { puts "Clicado!" }
botao.click  # => "Clicado!"
```

### Memoização

```ruby
def memoize
  cache = {}
  ->(arg) do
    unless cache.has_key?(arg)
      cache[arg] = yield(arg)
    end
    cache[arg]
  end
end

calcular = memoize { |n| n * 2 }
puts calcular.call(5)  # Calcula
puts calcular.call(5)  # Usa cache
```

## Padrões de Design com Closures

### Decorador

```ruby
def decorar_logger(metodo)
  -> (*args) do
    puts "Chamando método com #{args}"
    resultado = metodo.call(*args)
    puts "Resultado: #{resultado}"
    resultado
  end
end

calculo = ->(x, y) { x + y }
com_log = decorar_logger(calculo)
com_log.call(2, 3)
```

### Currying

```ruby
def curry_exemplo
  ->(x) do
    ->(y) do
      ->(z) { x + y + z }
    end
  end
end

soma = curry_exemplo
puts soma.call(1).call(2).call(3)  # => 6
```

## Boas Práticas

```ruby
# Use lambdas para comportamentos reutilizáveis
validar = ->(valor) { valor.to_s.strip.length > 0 }
["", "ruby", " "].select(&validar)

# Evite closures muito complexos
# Prefira extrair para classes quando a lógica crescer
class Calculadora
  def initialize(operacao)
    @operacao = operacao
  end

  def calcular(x, y)
    @operacao.call(x, y)
  end
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Proc.html">Documentação de Proc</a>
        <a href="https://ruby-doc.org/core/Method.html">Documentação de Method</a>
    </category>
</seealso>