# Classes e Objetos em Ruby

## Definindo Classes

Uma classe é um modelo para criar objetos. Em Ruby, classes são definidas usando a palavra-chave `class`.

```ruby
class Pessoa
  def initialize(nome, idade)
    @nome = nome
    @idade = idade
  end

  def apresentar
    "Olá, me chamo #{@nome} e tenho #{@idade} anos"
  end
end

# Criando um objeto
pessoa = Pessoa.new("Ana", 25)
puts pessoa.apresentar  # => "Olá, me chamo Ana e tenho 25 anos"
```

## Atributos

### Variáveis de Instância

```ruby
class Conta
  def initialize(saldo)
    @saldo = saldo  # Variável de instância
  end
end
```

### Getters e Setters

```ruby
class Pessoa
  # Forma manual
  def nome
    @nome
  end

  def nome=(novo_nome)
    @nome = novo_nome
  end

  # Forma automática usando attr_*
  attr_reader :idade     # Getter
  attr_writer :email     # Setter
  attr_accessor :telefone  # Getter e Setter
end
```

## Métodos

### Métodos de Instância

```ruby
class Calculadora
  def somar(a, b)
    a + b
  end

  def subtrair(a, b)
    a - b
  end
end

calc = Calculadora.new
puts calc.somar(5, 3)  # => 8
```

### Métodos de Classe

```ruby
class Tempo
  def self.agora
    Time.now
  end

  class << self
    def amanha
      Time.now + 86400
    end
  end
end

puts Tempo.agora    # Imprime o tempo atual
puts Tempo.amanha   # Imprime o tempo de amanhã
```

## Construtores

```ruby
class Produto
  def initialize(nome, preco)
    @nome = nome
    @preco = preco
    @criado_em = Time.now
  end

  # Construtor alternativo
  def self.from_hash(hash)
    new(hash[:nome], hash[:preco])
  end
end

# Diferentes formas de criar objetos
produto1 = Produto.new("Livro", 29.90)
produto2 = Produto.from_hash({ nome: "Caneta", preco: 4.50 })
```

## Visibilidade de Métodos

```ruby
class Documento
  def publico
    "Qualquer um pode me chamar"
  end

  protected

  def protegido
    "Apenas classes relacionadas podem me chamar"
  end

  private

  def privado
    "Apenas métodos internos podem me chamar"
  end
end
```

## Métodos Predicados

```ruby
class Pessoa
  def initialize(idade)
    @idade = idade
  end

  def maior_de_idade?
    @idade >= 18
  end

  def aposentado?
    @idade >= 65
  end
end

pessoa = Pessoa.new(30)
puts pessoa.maior_de_idade?  # => true
puts pessoa.aposentado?      # => false
```

## Comparação de Objetos

```ruby
class Ponto
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(outro)
    x == outro.x && y == outro.y
  end

  def eql?(outro)
    self == outro
  end

  def hash
    [x, y].hash
  end
end
```

## Objetos Singleton

```ruby
class Configuracao
  @instancia = nil

  def self.instancia
    @instancia ||= new
  end

  private_class_method :new
end
```

## Métodos Especiais

```ruby
class Pessoa
  def initialize(nome)
    @nome = nome
  end

  def to_s
    "Pessoa: #{@nome}"
  end

  def inspect
    "#<Pessoa:#{object_id} @nome='#{@nome}'>"
  end

  def respond_to_missing?(metodo, include_private = false)
    metodo.to_s.start_with?('falar_') || super
  end

  def method_missing(metodo, *args)
    if metodo.to_s.start_with?('falar_')
      "#{@nome} está falando #{metodo.to_s.sub('falar_', '')}"
    else
      super
    end
  end
end
```

## Boas Práticas

```ruby
class Usuario
  # Use attr_reader ao invés de attr_accessor quando possível
  attr_reader :nome, :email

  # Valide dados no initialize
  def initialize(nome, email)
    raise ArgumentError, "Nome não pode ser vazio" if nome.nil? || nome.empty?
    raise ArgumentError, "Email inválido" unless email.include?('@')
    
    @nome = nome
    @email = email
  end

  # Prefira métodos pequenos e focados
  def nome_completo
    "#{@nome} #{@sobrenome}"
  end

  # Use métodos predicados apropriadamente
  def valido?
    nome_valido? && email_valido?
  end

  private

  def nome_valido?
    @nome.length >= 2
  end

  def email_valido?
    @email.include?('@') && @email.include?('.')
  end
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Class.html">Documentação de Class</a>
        <a href="https://ruby-doc.org/core/Object.html">Documentação de Object</a>
    </category>
</seealso>