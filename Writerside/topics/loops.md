# Loops em Ruby

Ruby oferece várias formas de criar loops e iterações, cada uma com seus casos de uso específicos.

## while e until

### while

```ruby
# Estrutura básica
while condicao
  # código a ser executado
end

# Exemplo prático
contador = 0
while contador < 5
  puts contador
  contador += 1
end

# Forma modificadora
puts "Ainda processando..." while processo_ativo?
```

### until

```ruby
# Estrutura básica
until condicao
  # código a ser executado
end

# Exemplo prático
tempo = 10
until tempo.zero?
  puts "#{tempo} segundos restantes"
  tempo -= 1
  sleep 1
end
```

## for e each

### for

```ruby
# Iterando sobre range
for i in 0..5
  puts "Número: #{i}"
end

# Iterando sobre array
frutas = ["maçã", "banana", "laranja"]
for fruta in frutas
  puts "Fruta: #{fruta}"
end
```

### each

```ruby
# Com arrays
[1, 2, 3].each do |numero|
  puts "O dobro de #{numero} é #{numero * 2}"
end

# Com hashes
usuario = { nome: "João", idade: 30 }
usuario.each do |chave, valor|
  puts "#{chave}: #{valor}"
end

# Forma compacta
(1..5).each { |n| print "#{n} " }
```

## loop

```ruby
# Loop infinito com break
loop do
  print "Digite 'sair' para encerrar: "
  entrada = gets.chomp
  break if entrada == 'sair'
end

# Com contador
contador = 0
loop do
  puts contador
  contador += 1
  break if contador >= 5
end
```

## Controle de Loop

### break, next e redo

```ruby
# break - sai do loop
numeros = [1, 2, 3, 4, 5]
numeros.each do |n|
  break if n > 3
  puts n
end

# next - pula para próxima iteração
numeros.each do |n|
  next if n.even?
  puts n
end

# redo - repete a iteração atual
tentativas = 0
numeros.each do |n|
  tentativas += 1
  redo if falhou?(n) && tentativas < 3
end
```

## Iteradores Especiais

### times

```ruby
5.times do |i|
  puts "Iteração #{i}"
end

# Forma compacta
3.times { puts "Olá!" }
```

### upto e downto

```ruby
# Contagem crescente
1.upto(5) do |n|
  puts n
end

# Contagem regressiva
5.downto(1) do |n|
  puts n
end
```

### step

```ruby
# Contando de 2 em 2
0.step(10, 2) do |n|
  puts n
end

# Números decimais
0.0.step(1.0, 0.2) { |n| puts n }
```

## Exemplos Práticos

### Processamento de Dados

```ruby
def processar_lista(items)
  items.each_with_index do |item, index|
    next if item.nil?
    break if index > 100  # limite de segurança
    
    resultado = processar_item(item)
    redo if resultado == :retry
  end
end

def ler_arquivo(caminho)
  File.foreach(caminho) do |linha|
    next if linha.strip.empty?
    yield linha if block_given?
  end
end
```

### Menus Interativos

```ruby
def menu_principal
  loop do
    puts "\n=== Menu Principal ==="
    puts "1. Novo jogo"
    puts "2. Carregar jogo"
    puts "3. Configurações"
    puts "4. Sair"
    
    print "\nEscolha uma opção: "
    opcao = gets.chomp
    
    case opcao
    when "1" then novo_jogo
    when "2" then carregar_jogo
    when "3" then configuracoes
    when "4" then break
    else puts "Opção inválida!"
    end
  end
end
```

## Boas Práticas

```ruby
# Prefira each sobre for
# Não recomendado
for i in array
  # código
end

# Recomendado
array.each do |item|
  # código
end

# Use iteradores específicos quando possível
# Não recomendado
i = 0
while i < 5
  puts i
  i += 1
end

# Recomendado
5.times { |i| puts i }

# Evite loops infinitos acidentais
# Sempre tenha uma condição de saída clara
loop do
  # código
  break if condicao_saida
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Enumerable.html">Documentação do Enumerable</a>
        <a href="https://ruby-doc.org/core/Integer.html">Documentação de Integer (para times, upto, etc)</a>
    </category>
</seealso>