# Blocos e Iteradores em Ruby

Blocos e iteradores são conceitos fundamentais em Ruby que permitem escrever código mais elegante e reutilizável.

## Blocos

### Sintaxe Básica

```ruby
# Sintaxe com chaves (uma linha)
[1, 2, 3].each { |numero| puts numero }

# Sintaxe do/end (múltiplas linhas)
[1, 2, 3].each do |numero|
  dobro = numero * 2
  puts "O dobro de #{numero} é #{dobro}"
end
```

### Yield

```ruby
# Método que aceita um bloco
def executar_tres_vezes
  yield
  yield
  yield
end

executar_tres_vezes { puts "Ruby!" }

# Yield com parâmetros
def processar_item(item)
  puts "Iniciando processamento..."
  yield(item) if block_given?
  puts "Processamento finalizado."
end

processar_item("dados") { |x| puts "Processando #{x}..." }
```

### Blocos como Objetos

```ruby
# Convertendo bloco em Proc
multiplicador = Proc.new { |x| x * 2 }
puts multiplicador.call(5)  # => 10

# Lambda
dobrar = ->(x) { x * 2 }
puts dobrar.call(5)        # => 10

# Diferenças entre Proc e Lambda
def retorno_proc
  proc = Proc.new { return "Dentro do Proc" }
  proc.call
  "Depois do Proc"
end

def retorno_lambda
  lambda = -> { return "Dentro do Lambda" }
  lambda.call
  "Depois do Lambda"
end
```

## Iteradores

### Iteradores Básicos

```ruby
# each
[1, 2, 3].each { |n| puts n }

# map/collect
numeros = [1, 2, 3]
dobrados = numeros.map { |n| n * 2 }  # => [2, 4, 6]

# select/find_all
pares = (1..10).select { |n| n.even? }  # => [2, 4, 6, 8, 10]

# reject
impares = (1..10).reject { |n| n.even? }  # => [1, 3, 5, 7, 9]
```

### Iteradores Avançados

```ruby
# reduce/inject
soma = [1, 2, 3, 4].reduce(0) { |acc, n| acc + n }  # => 10

# each_with_index
["a", "b", "c"].each_with_index do |letra, index|
  puts "#{index}: #{letra}"
end

# each_with_object
hash = ["a", "b", "c"].each_with_object({}) do |item, hash|
  hash[item] = item.upcase
end
```

## Implementando Iteradores Personalizados

```ruby
class Fibonacci
  include Enumerable
  
  def initialize(max)
    @max = max
  end
  
  def each
    return enum_for(:each) unless block_given?
    
    a, b = 1, 1
    while a <= @max
      yield a
      a, b = b, a + b
    end
  end
end

# Uso
fib = Fibonacci.new(100)
fib.each { |n| print "#{n} " }  # => 1 1 2 3 5 8 13 21 34 55 89
```

## Exemplos Práticos

### Processamento de Arquivos

```ruby
def processar_arquivo(nome_arquivo)
  File.open(nome_arquivo) do |file|
    file.each_line do |linha|
      next if linha.strip.empty?
      yield linha if block_given?
    end
  end
end

processar_arquivo("dados.txt") do |linha|
  puts "Processando: #{linha}"
end
```

### Transações em Banco de Dados

```ruby
def with_transaction
  begin
    iniciar_transacao
    yield
    commit_transacao
  rescue
    rollback_transacao
    raise
  end
end

with_transaction do
  # operações no banco de dados
  criar_usuario(dados)
  atualizar_perfil(perfil)
end
```

## Boas Práticas

```ruby
# Use &block para passar blocos como último parâmetro
def meu_metodo(opcoes = {}, &block)
  # configuração inicial
  block.call if block
end

# Verifique se um bloco foi fornecido
def metodo_com_bloco
  return "Nenhum bloco fornecido" unless block_given?
  yield
end

# Prefira map a each quando transformar dados
# Ruim
numeros = []
[1, 2, 3].each { |n| numeros << n * 2 }

# Melhor
numeros = [1, 2, 3].map { |n| n * 2 }
```

## Padrões Comuns

### Builder Pattern

```ruby
class RelatorioBuilder
  def initialize
    @relatorio = Relatorio.new
  end
  
  def build
    yield(self)
    @relatorio
  end
  
  def adicionar_titulo(titulo)
    @relatorio.titulo = titulo
    self
  end
  
  def adicionar_conteudo(conteudo)
    @relatorio.conteudo = conteudo
    self
  end
end

relatorio = RelatorioBuilder.new.build do |b|
  b.adicionar_titulo("Relatório Mensal")
   .adicionar_conteudo("Dados do mês...")
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Enumerable.html">Documentação do Enumerable</a>
        <a href="https://ruby-doc.org/core/Proc.html">Documentação de Proc</a>
    </category>
</seealso>