# Composição em Ruby

## Conceitos Básicos

A composição é um princípio de design onde objetos complexos são construídos a partir de objetos mais simples, estabelecendo uma relação "tem um" entre eles.

### Composição vs Herança

```ruby
# Herança - "é um"
class Ave
  def voar
    "Voando..."
  end
end

class Papagaio < Ave
end

# Composição - "tem um"
class Aviao
  def initialize
    @motor = Motor.new
    @asas = Asas.new
  end

  def voar
    return "Não é possível voar" unless @motor.funcionando? && @asas.ok?
    "Decolando..."
  end
end
```

## Implementando Composição

### Composição Básica

```ruby
class Carro
  def initialize
    @motor = Motor.new
    @transmissao = Transmissao.new
    @rodas = Array.new(4) { Roda.new }
  end

  def ligar
    @motor.ligar
    @transmissao.em_neutro
  end

  def dirigir
    return false unless @motor.ligado?
    @transmissao.engatar_primeira
    true
  end
end
```

### Injeção de Dependências

```ruby
class Computador
  def initialize(processador:, memoria:, armazenamento:)
    @processador = processador
    @memoria = memoria
    @armazenamento = armazenamento
  end

  def iniciar
    @processador.ligar
    @memoria.verificar
    @armazenamento.montar
  end
end

pc = Computador.new(
  processador: Intel.new,
  memoria: RAM.new(16),
  armazenamento: SSD.new(512)
)
```

## Padrões de Composição

### Delegação

```ruby
class Playlist
  def initialize
    @musicas = []
    @player = AudioPlayer.new
  end

  # Delegando métodos para @player
  def play
    @player.play(@musicas.first)
  end

  def pause
    @player.pause
  end

  def add_musica(musica)
    @musicas << musica
  end
end
```

### Composição com Módulos

```ruby
module Logger
  def log(mensagem)
    puts "[#{Time.now}] #{mensagem}"
  end
end

class ServicoEmail
  def initialize
    @logger = Object.new.extend(Logger)
  end

  def enviar(email)
    @logger.log("Enviando email para #{email}")
    # Lógica de envio
  end
end
```

## Composição Flexível

### Componentes Intercambiáveis

```ruby
class Notificador
  def initialize(servicos = [])
    @servicos = servicos
  end

  def notificar(mensagem)
    @servicos.each { |servico| servico.enviar(mensagem) }
  end
end

notificador = Notificador.new([
  EmailNotificacao.new,
  SMSNotificacao.new,
  SlackNotificacao.new
])
```

### Composição Dinâmica

```ruby
class Editor
  def initialize
    @plugins = {}
  end

  def adicionar_plugin(nome, plugin)
    @plugins[nome] = plugin
  end

  def remover_plugin(nome)
    @plugins.delete(nome)
  end

  def executar_plugin(nome, *args)
    if @plugins[nome]
      @plugins[nome].executar(*args)
    end
  end
end
```

## Boas Práticas

### Composição sobre Herança

```ruby
# Evite herança profunda
class Animal < SerVivo < Organismo < Entidade # Ruim

# Prefira composição
class Animal
  def initialize
    @metabolismo = Metabolismo.new
    @reproducao = Reproducao.new
    @movimento = Movimento.new
  end
end
```

### Interfaces Claras

```ruby
class Relatorio
  def initialize(formatador:, dados:)
    @formatador = formatador
    @dados = dados
  end

  def gerar
    conteudo = processar_dados
    @formatador.formatar(conteudo)
  end

  private

  def processar_dados
    @dados.map { |dado| dado.to_h }
  end
end
```

## Exemplos Práticos

### Sistema de Pagamento

```ruby
class ProcessadorPagamento
  def initialize(gateway:, validador:, notificador:)
    @gateway = gateway
    @validador = validador
    @notificador = notificador
  end

  def processar(pagamento)
    return false unless @validador.validar(pagamento)
    
    if @gateway.cobrar(pagamento)
      @notificador.sucesso(pagamento)
      true
    else
      @notificador.falha(pagamento)
      false
    end
  end
end
```

### Gerador de Relatórios

```ruby
class GeradorRelatorio
  def initialize
    @coletores = []
    @processadores = []
    @formatadores = []
  end

  def adicionar_coletor(coletor)
    @coletores << coletor
  end

  def adicionar_processador(processador)
    @processadores << processador
  end

  def adicionar_formatador(formatador)
    @formatadores << formatador
  end

  def gerar
    dados = @coletores.map(&:coletar).flatten
    dados = @processadores.reduce(dados) { |acc, proc| proc.processar(acc) }
    @formatadores.map { |fmt| fmt.formatar(dados) }
  end
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Module.html">Documentação de Modules</a>
        <a href="https://ruby-doc.org/core/Object.html">Documentação de Object</a>
    </category>
</seealso>