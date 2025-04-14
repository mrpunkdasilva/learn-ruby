# Entrada e Saída Básica em Ruby

## Saída de Dados

### puts vs print vs p

```ruby
# puts - adiciona nova linha automaticamente
puts "Olá, Mundo!"  # => Olá, Mundo!
                    # => (nova linha)

# print - não adiciona nova linha
print "Olá, "
print "Mundo!"      # => Olá, Mundo!(sem nova linha)

# p - mostra representação mais detalhada
p "Olá\nMundo"      # => "Olá\nMundo"
p [1, 2, 3]         # => [1, 2, 3]
```

### Formatação de Strings

```ruby
nome = "Ruby"
versao = 3.2

# Interpolação
puts "#{nome} versão #{versao}"

# printf
printf("%-10s %04d\n", "Ruby", 42)    # => Ruby      0042
printf("Pi: %.2f\n", Math::PI)        # => Pi: 3.14

# format (sprintf)
puts format("%.2f%%", 99.9999)        # => 100.00%
```

## Entrada de Dados

### gets e STDIN

```ruby
# Leitura básica
print "Digite seu nome: "
nome = gets           # Lê uma linha (inclui \n)
nome = gets.chomp     # Lê uma linha (remove \n)

# Leitura segura do STDIN
input = STDIN.gets

# Leitura com timeout
require 'timeout'
begin
  puts "Você tem 5 segundos..."
  input = Timeout::timeout(5) { gets }
rescue Timeout::Error
  puts "Tempo esgotado!"
end
```

### Leitura de Diferentes Tipos

```ruby
# Lendo números
print "Digite um número: "
numero = gets.chomp.to_i    # Para inteiros
numero = gets.chomp.to_f    # Para float

# Lendo múltiplos valores
print "Digite dois números (separados por espaço): "
x, y = gets.chomp.split.map(&:to_i)
```

## Entrada/Saída com ARGV

```ruby
# script.rb
if ARGV.empty?
  puts "Uso: ruby script.rb <nome>"
  exit
end

nome = ARGV[0]
puts "Olá, #{nome}!"

# Terminal: ruby script.rb Alice
# => Olá, Alice!
```

## Manipulação de Erros

```ruby
# Saída de erro
STDERR.puts "Erro: arquivo não encontrado"

# Redirecionamento de saída
$stdout = File.new('saida.log', 'w')
puts "Isso vai para o arquivo"
$stdout = STDOUT  # Restaura saída padrão
```

## Interatividade

```ruby
def menu
  loop do
    print "\nEscolha uma opção:\n" \
          "1. Novo\n" \
          "2. Abrir\n" \
          "3. Sair\n" \
          "Opção: "
    
    case gets.chomp
    when '1' then puts "Criando novo..."
    when '2' then puts "Abrindo..."
    when '3' then break
    else puts "Opção inválida!"
    end
  end
end

# Interface simples
def confirmar(mensagem)
  print "#{mensagem} (s/n): "
  gets.chomp.downcase == 's'
end
```

## Boas Práticas

```ruby
# Validação de entrada
def ler_numero
  print "Digite um número: "
  Integer(gets.chomp)
rescue ArgumentError
  puts "Entrada inválida! Tente novamente."
  retry
end

# Mensagens claras
def solicitar_entrada(prompt)
  print "#{prompt}: "
  gets.chomp
end

# Feedback ao usuário
def processar_dados(dados)
  print "Processando..."
  resultado = dados.upcase
  puts "concluído!"
  resultado
end
```

## Exemplos Práticos

```ruby
# Calculadora simples
def calculadora
  print "Digite o primeiro número: "
  n1 = gets.chomp.to_f
  
  print "Digite a operação (+,-,*,/): "
  op = gets.chomp
  
  print "Digite o segundo número: "
  n2 = gets.chomp.to_f
  
  resultado = case op
  when '+' then n1 + n2
  when '-' then n1 - n2
  when '*' then n1 * n2
  when '/' then n1 / n2
  else "Operação inválida"
  end
  
  puts "Resultado: #{resultado}"
end

# Leitor de senhas
def ler_senha
  require 'io/console'
  print "Digite sua senha: "
  STDIN.noecho(&:gets).chomp
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/IO.html">Documentação de IO</a>
        <a href="https://ruby-doc.org/core/Kernel.html">Documentação de Kernel</a>
    </category>
</seealso>