# Estruturas de Controle em Ruby

As estruturas de controle em Ruby permitem controlar o fluxo de execução do programa de forma elegante e expressiva.

## Visão Geral

Ruby oferece diversas estruturas de controle que podem ser categorizadas em:
- Estruturas condicionais
- Estruturas de repetição
- Estruturas de salto

## Estruturas Condicionais

### if/else/elsif

```ruby
if idade >= 18
  puts "Maior de idade"
elsif idade >= 13
  puts "Adolescente"
else
  puts "Criança"
end

# Forma modificadora (one-liner)
puts "Pode dirigir" if idade >= 18
```

### unless

```ruby
unless temperatura > 30
  puts "Está agradável"
end

# Forma modificadora
puts "Precisa de casaco" unless temperatura > 20
```

### case/when

```ruby
case idade
when 0..12
  puts "Criança"
when 13..17
  puts "Adolescente"
when 18..64
  puts "Adulto"
else
  puts "Idoso"
end

# Forma concisa com atribuição
status = case idade
         when 0..17 then "Menor"
         when 18..64 then "Adulto"
         else "Idoso"
         end
```

## Estruturas de Repetição

### while

```ruby
contador = 0
while contador < 5
  puts contador
  contador += 1
end

# Forma modificadora
contador += 1 while contador < 5
```

### until

```ruby
numero = 1
until numero > 10
  puts numero
  numero *= 2
end

# Forma modificadora
numero *= 2 until numero > 10
```

### for

```ruby
for i in 1..5
  puts i
end

for item in ['a', 'b', 'c']
  puts item
end
```

### loop

```ruby
loop do
  print "Digite 'sair' para encerrar: "
  comando = gets.chomp
  break if comando == 'sair'
end
```

## Estruturas de Salto

### break

```ruby
10.times do |i|
  break if i > 5
  puts i
end
```

### next

```ruby
5.times do |i|
  next if i.even?
  puts "Número ímpar: #{i}"
end
```

### redo

```ruby
count = 0
for i in 0..5
  puts i
  if i == 2 && count == 0
    count += 1
    redo  # Repete a iteração atual
  end
end
```

### retry

```ruby
tentativas = 0
begin
  # Código que pode falhar
  raise "erro" if tentativas == 0
rescue
  tentativas += 1
  retry if tentativas < 3
end
```

## Blocos begin/end

### begin/rescue/ensure

```ruby
begin
  # Código que pode gerar erro
  arquivo = File.open("nao_existe.txt")
rescue Errno::ENOENT
  puts "Arquivo não encontrado"
rescue => e
  puts "Outro erro: #{e.message}"
ensure
  # Sempre executado
  arquivo&.close
end
```

## Boas Práticas

```ruby
# Prefira unless a if !
# Ruim
if !arquivo.existe?
  puts "Arquivo não encontrado"
end

# Melhor
unless arquivo.existe?
  puts "Arquivo não encontrado"
end

# Use modificadores para condições simples
puts "Par" if numero.even?

# Evite else com unless
# Ruim
unless idade >= 18
  puts "Menor"
else
  puts "Adulto"
end

# Melhor
if idade >= 18
  puts "Adulto"
else
  puts "Menor"
end

# Use case quando houver múltiplas condições
# Ruim
if status == :pendente
  processar_pendente
elsif status == :aprovado
  processar_aprovado
elsif status == :rejeitado
  processar_rejeitado
end

# Melhor
case status
when :pendente then processar_pendente
when :aprovado then processar_aprovado
when :rejeitado then processar_rejeitado
end
```

## Exemplos Práticos

```ruby
def processar_pedido(pedido)
  case pedido.status
  when :novo
    validar_pedido(pedido)
  when :validado
    calcular_total(pedido)
  when :pago
    enviar_confirmacao(pedido)
  else
    raise "Status inválido: #{pedido.status}"
  end
end

def ler_arquivo_seguro(caminho)
  return unless File.exist?(caminho)
  
  begin
    File.read(caminho)
  rescue => e
    puts "Erro ao ler arquivo: #{e.message}"
    nil
  end
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/doc/syntax/control_expressions_rdoc.html">Documentação de Estruturas de Controle</a>
        <a href="https://ruby-doc.org/core/doc/syntax/exceptions_rdoc.html">Documentação de Exceções</a>
    </category>
</seealso>