# Programação Orientada a Objetos em Ruby

## Fundamentos

Em Ruby, tudo é um objeto. Esta não é apenas uma frase de efeito - é um princípio fundamental da linguagem.

### O Básico dos Objetos

```ruby
# Até números são objetos
42.class          # => Integer
42.methods.sort   # Lista todos os métodos disponíveis

# Strings também são objetos
"ruby".upcase     # => "RUBY"
"ruby".reverse    # => "ybur"
```

## Os Quatro Pilares da OOP

### 1. Encapsulamento

```ruby
class ContaBancaria
  def initialize(saldo_inicial)
    @saldo = saldo_inicial
  end

  def depositar(valor)
    @saldo += valor
  end

  private

  def validar_saldo
    @saldo > 0
  end
end
```

### 2. Herança

```ruby
class Animal
  def falar
    "Som genérico"
  end
end

class Cachorro < Animal
  def falar
    "Au au!"
  end
end
```

### 3. Polimorfismo

```ruby
class Ave
  def voar
    "Voando..."
  end
end

class Pinguim < Ave
  def voar
    "Desculpe, não posso voar"
  end
end

def fazer_voar(ave)
  ave.voar
end
```

### 4. Abstração

```ruby
class Veiculo
  def iniciar
    ligar_motor
    verificar_sistemas
    liberar_freios
  end

  private

  def ligar_motor
    # Implementação específica
  end

  def verificar_sistemas
    # Implementação específica
  end
end
```

## Características Únicas em Ruby

### Duck Typing

```ruby
def processar(objeto)
  if objeto.respond_to?(:calcular)
    objeto.calcular
  else
    "Objeto não suporta cálculo"
  end
end
```

### Mixins com Modules

```ruby
module Nadador
  def nadar
    "Nadando..."
  end
end

class Pato
  include Nadador
end

pato = Pato.new
pato.nadar  # => "Nadando..."
```

### Open Classes

```ruby
class String
  def palindromo?
    self.downcase == self.downcase.reverse
  end
end

"ovo".palindromo?  # => true
```

## Boas Práticas

### SOLID em Ruby

```ruby
# Single Responsibility Principle
class RelatorioFinanceiro
  def gerar
    dados = coletar_dados
    formatar(dados)
  end

  private

  def coletar_dados
    # Lógica de coleta
  end

  def formatar(dados)
    # Lógica de formatação
  end
end
```

### Composição vs Herança

```ruby
# Preferir composição
class Carro
  def initialize
    @motor = Motor.new
    @transmissao = Transmissao.new
  end

  def ligar
    @motor.ligar
    @transmissao.engatar
  end
end
```

## Padrões de Design Comuns

### Factory Method

```ruby
class DocumentoFactory
  def self.criar(tipo)
    case tipo
    when :pdf
      PDFDocument.new
    when :doc
      WordDocument.new
    else
      raise "Tipo de documento desconhecido"
    end
  end
end
```

### Singleton

```ruby
require 'singleton'

class Logger
  include Singleton
  
  def log(msg)
    puts "[LOG] #{msg}"
  end
end

Logger.instance.log("Mensagem")
```

## Dicas e Truques

### Method Missing

```ruby
class Tradutor
  def method_missing(nome_metodo, *args)
    palavra = nome_metodo.to_s
    if palavra.start_with?("traduzir_")
      "Tradução de: #{palavra.sub('traduzir_', '')}"
    else
      super
    end
  end
end
```

### Reflexão

```ruby
class Exemplo
  def initialize
    @variavel = 42
  end

  def listar_metodos
    methods - Object.methods
  end

  def listar_variaveis
    instance_variables
  end
end
```

## Recursos Avançados

### Metaprogramação Básica

```ruby
class Dinamico
  def self.criar_metodo(nome)
    define_method(nome) do |arg|
      "Método #{nome} chamado com #{arg}"
    end
  end
end

Dinamico.criar_metodo(:teste)
```

### Delegação

```ruby
require 'forwardable'

class Playlist
  extend Forwardable
  def_delegators :@songs, :<<, :first, :last

  def initialize
    @songs = []
  end
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Object.html">Documentação de Object</a>
        <a href="https://ruby-doc.org/core/Module.html">Documentação de Module</a>
        <a href="https://ruby-doc.org/core/Class.html">Documentação de Class</a>
    </category>
</seealso>