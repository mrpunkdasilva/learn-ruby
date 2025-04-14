# Herança em Ruby

## Conceitos Básicos

A herança é um dos pilares fundamentais da programação orientada a objetos. Em Ruby, uma classe pode herdar características de apenas uma classe pai (herança simples).

```ruby
class Animal
  def initialize(nome)
    @nome = nome
  end

  def falar
    "Som genérico"
  end
end

class Cachorro < Animal
  def falar
    "Au au!"
  end
end

rex = Cachorro.new("Rex")
puts rex.falar  # => "Au au!"
```

## Super

### Usando super com initialize

```ruby
class Veiculo
  def initialize(marca)
    @marca = marca
  end
end

class Carro < Veiculo
  def initialize(marca, modelo)
    super(marca)
    @modelo = modelo
  end
end

fusca = Carro.new("VW", "Fusca")
```

### Super sem Parênteses

```ruby
class Animal
  def dormir
    "ZzZzZz..."
  end
end

class Gato < Animal
  def dormir
    super + " Miau..."
  end
end
```

## Hierarquia de Classes

### Verificando a Hierarquia

```ruby
class A; end
class B < A; end
class C < B; end

puts C.ancestors  # => [C, B, A, Object, Kernel, BasicObject]
puts C.superclass # => B
```

### is_a? e kind_of?

```ruby
gato = Gato.new
puts gato.is_a?(Gato)     # => true
puts gato.is_a?(Animal)   # => true
puts gato.kind_of?(Object) # => true
```

## Métodos e Visibilidade

### Sobrescrevendo Métodos

```ruby
class Pessoa
  def apresentar
    "Olá, sou uma pessoa"
  end
end

class Funcionario < Pessoa
  def apresentar
    "#{super} e trabalho aqui"
  end
end
```

### Visibilidade na Herança

```ruby
class Animal
  protected
  def protegido
    "Método protegido"
  end

  private
  def privado
    "Método privado"
  end
end

class Cachorro < Animal
  def chamar_protegido
    protegido  # OK
  end

  def chamar_privado
    privado    # OK
  end
end
```

## Herança e Composição

### Quando Usar Cada Uma

```ruby
# Herança - "é um"
class Ave
  def voar
    "Voando..."
  end
end

class Papagaio < Ave
  def falar
    "Olá!"
  end
end

# Composição - "tem um"
class Motor
  def ligar
    "Motor ligado"
  end
end

class Carro
  def initialize
    @motor = Motor.new
  end

  def ligar
    @motor.ligar
  end
end
```

## Abstract e Interface

### Simulando Classes Abstratas

```ruby
class Animal
  def falar
    raise NotImplementedError, "#{self.class} precisa implementar o método 'falar'"
  end
end

class Cachorro < Animal
  def falar
    "Au au!"
  end
end
```

### Simulando Interfaces

```ruby
module Nadador
  def nadar
    raise NotImplementedError
  end
end

class Peixe
  include Nadador
  
  def nadar
    "Nadando como um peixe"
  end
end
```

## Boas Práticas

### Princípio de Substituição de Liskov

```ruby
class Retangulo
  def initialize(largura, altura)
    @largura = largura
    @altura = altura
  end

  def area
    @largura * @altura
  end
end

class Quadrado < Retangulo
  def initialize(lado)
    super(lado, lado)
  end
end
```

### Evitando Herança Profunda

```ruby
# Evite isso
class A; end
class B < A; end
class C < B; end
class D < C; end  # Muito profundo!

# Prefira composição
class D
  def initialize
    @b = B.new
    @c = C.new
  end
end
```

## Padrões Comuns

### Template Method

```ruby
class Relatorio
  def gerar
    coletar_dados
    processar_dados
    formatar_saida
  end

  private

  def coletar_dados
    raise NotImplementedError
  end

  def processar_dados
    raise NotImplementedError
  end

  def formatar_saida
    raise NotImplementedError
  end
end

class RelatorioVendas < Relatorio
  private

  def coletar_dados
    # Implementação específica
  end

  def processar_dados
    # Implementação específica
  end

  def formatar_saida
    # Implementação específica
  end
end
```

### Factory Method

```ruby
class Animal
  def self.criar(tipo)
    case tipo
    when :cachorro
      Cachorro.new
    when :gato
      Gato.new
    else
      raise "Tipo de animal desconhecido"
    end
  end
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Class.html#method-i-superclass">Documentação de Class#superclass</a>
        <a href="https://ruby-doc.org/core/Module.html#method-i-ancestors">Documentação de Module#ancestors</a>
    </category>
</seealso>