# Encapsulamento em Ruby

## Conceitos Básicos

O encapsulamento é um dos princípios fundamentais da programação orientada a objetos, que consiste em esconder os detalhes internos de implementação e fornecer uma interface pública para interação com o objeto.

### Variáveis de Instância

```ruby
class ContaBancaria
  def initialize(saldo_inicial)
    @saldo = saldo_inicial  # Variável de instância privada
  end

  def consultar_saldo
    @saldo
  end

  def depositar(valor)
    @saldo += valor if valor > 0
  end
end

conta = ContaBancaria.new(1000)
puts conta.consultar_saldo  # => 1000
```

## Níveis de Acesso

### Public

```ruby
class Produto
  def initialize(nome, preco)
    @nome = nome
    @preco = preco
  end

  # Métodos públicos por padrão
  def descricao
    "#{@nome} - R$ #{@preco}"
  end
end
```

### Protected

```ruby
class Funcionario
  def initialize(salario)
    @salario = salario
  end

  def compara_salario(outro_funcionario)
    @salario > outro_funcionario.salario_protegido
  end

  protected

  def salario_protegido
    @salario
  end
end
```

### Private

```ruby
class Processador
  def executar
    preparar
    processar
    finalizar
  end

  private

  def preparar
    # Lógica interna
  end

  def processar
    # Lógica interna
  end

  def finalizar
    # Lógica interna
  end
end
```

## Getters e Setters

### Métodos Tradicionais

```ruby
class Pessoa
  def initialize(nome)
    @nome = nome
  end

  # Getter
  def nome
    @nome
  end

  # Setter
  def nome=(novo_nome)
    @nome = novo_nome
  end
end
```

### Usando attr_*

```ruby
class Produto
  # Getter e Setter
  attr_accessor :nome, :preco
  
  # Apenas Getter
  attr_reader :codigo
  
  # Apenas Setter
  attr_writer :desconto

  def initialize(nome, preco, codigo)
    @nome = nome
    @preco = preco
    @codigo = codigo
    @desconto = 0
  end
end
```

## Validações e Controle de Acesso

### Validando Dados

```ruby
class Conta
  def initialize
    @saldo = 0
  end

  def depositar(valor)
    raise ArgumentError, "Valor deve ser positivo" unless valor > 0
    @saldo += valor
  end

  def sacar(valor)
    raise ArgumentError, "Saldo insuficiente" if valor > @saldo
    @saldo -= valor
  end
end
```

### Customizando Getters e Setters

```ruby
class Produto
  def preco
    @preco
  end

  def preco=(novo_preco)
    raise "Preço inválido" if novo_preco < 0
    @preco = novo_preco
  end

  def desconto=(valor)
    @desconto = if valor > 0.3
                  0.3  # Limita desconto a 30%
                else
                  valor
                end
  end
end
```

## Padrões de Encapsulamento

### Value Object

```ruby
class Coordenada
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # Objetos imutáveis
  def mover(dx, dy)
    Coordenada.new(@x + dx, @y + dy)
  end
end
```

### Tell, Don't Ask

```ruby
# Evite isso
class Pedido
  def calcular_desconto
    if @cliente.vip?
      @valor * 0.2
    else
      @valor * 0.1
    end
  end
end

# Prefira isso
class Pedido
  def calcular_desconto
    @cliente.aplicar_desconto(@valor)
  end
end

class Cliente
  def aplicar_desconto(valor)
    desconto = vip? ? 0.2 : 0.1
    valor * desconto
  end
end
```

## Boas Práticas

### Princípio da Responsabilidade Única

```ruby
# Ruim
class Usuario
  def salvar
    # Lógica de banco de dados
  end

  def enviar_email
    # Lógica de envio de email
  end
end

# Melhor
class Usuario
  def salvar
    UsuarioRepository.new.salvar(self)
  end
end

class NotificadorEmail
  def notificar(usuario)
    # Lógica de envio de email
  end
end
```

### Lei de Demeter

```ruby
# Evite isso
class Pedido
  def processar
    @cliente.carteira.conta.debitar(@valor)
  end
end

# Prefira isso
class Pedido
  def processar
    @cliente.debitar(@valor)
  end
end

class Cliente
  def debitar(valor)
    @carteira.debitar(valor)
  end
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Module.html#method-i-private">Documentação de visibilidade de métodos</a>
        <a href="https://ruby-doc.org/core/Module.html#method-i-attr_accessor">Documentação de attr_accessor</a>
    </category>
</seealso>