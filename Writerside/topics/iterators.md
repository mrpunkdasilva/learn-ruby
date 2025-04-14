# Iteradores em Ruby

Os iteradores são métodos que permitem percorrer coleções de elementos de forma elegante e eficiente.

## Iteradores Básicos

### each

```ruby
# Iterando sobre um array
[1, 2, 3].each do |numero|
  puts "Número: #{numero}"
end

# Iterando sobre um hash
{nome: "Ruby", tipo: "Linguagem"}.each do |chave, valor|
  puts "#{chave}: #{valor}"
end
```

### times

```ruby
# Executando um bloco n vezes
5.times do |i|
  puts "Iteração #{i}"
end

# Versão compacta
3.times { puts "Ruby!" }
```

### upto e downto

```ruby
# Contagem crescente
1.upto(5) do |n|
  puts "Contando até #{n}"
end

# Contagem regressiva
5.downto(1) do |n|
  puts "Contagem regressiva: #{n}"
end
```

## Iteradores de Transformação

### map/collect

```ruby
# Transformando elementos
numeros = [1, 2, 3, 4, 5]
dobrados = numeros.map { |n| n * 2 }
puts dobrados  # => [2, 4, 6, 8, 10]

# Com múltiplas linhas
maiusculas = ["a", "b", "c"].map do |letra|
  letra.upcase
end
```

### select/find_all e reject

```ruby
# Filtrando elementos
numeros = (1..10).to_a
pares = numeros.select { |n| n.even? }
impares = numeros.reject { |n| n.even? }

# Com condições mais complexas
palavras = ["ruby", "python", "java", "javascript"]
longas = palavras.select do |palavra|
  palavra.length > 4
end
```

## Iteradores Especializados

### each_with_index

```ruby
# Acesso ao índice durante iteração
frutas = ["maçã", "banana", "laranja"]
frutas.each_with_index do |fruta, indice|
  puts "#{indice + 1}. #{fruta}"
end
```

### each_with_object

```ruby
# Construindo um novo objeto durante iteração
resultado = ["a", "b", "c"].each_with_object({}) do |letra, hash|
  hash[letra] = letra.upcase
end
puts resultado  # => {"a"=>"A", "b"=>"B", "c"=>"C"}
```

### inject/reduce

```ruby
# Acumulando valores
soma = [1, 2, 3, 4, 5].inject(0) { |acc, n| acc + n }
puts soma  # => 15

# Exemplo com strings
palavras = ["ruby", "é", "incrível"]
frase = palavras.inject("") do |resultado, palavra|
  "#{resultado} #{palavra}".strip
end
```

## Iteradores de Enumeráveis

### any? e all?

```ruby
# Verificando condições
numeros = [2, 4, 6, 8]
todos_pares = numeros.all? { |n| n.even? }  # => true
algum_maior_que_cinco = numeros.any? { |n| n > 5 }  # => true
```

### find/detect

```ruby
# Encontrando o primeiro elemento que satisfaz uma condição
primeiro_maior_que_cinco = (1..10).find { |n| n > 5 }
puts primeiro_maior_que_cinco  # => 6
```

## Exemplos Práticos

### Processamento de Dados

```ruby
class Produto
  attr_reader :nome, :preco
  
  def initialize(nome, preco)
    @nome = nome
    @preco = preco
  end
end

produtos = [
  Produto.new("Laptop", 5000),
  Produto.new("Mouse", 100),
  Produto.new("Teclado", 300)
]

# Filtrando produtos caros
caros = produtos.select { |p| p.preco > 1000 }

# Calculando valor total
total = produtos.inject(0) { |soma, p| soma + p.preco }
```

### Manipulação de Arquivos

```ruby
def processar_linhas(arquivo)
  File.readlines(arquivo).each_with_index do |linha, numero|
    yield linha.chomp, numero + 1 if block_given?
  end
end

processar_linhas("log.txt") do |conteudo, linha|
  puts "Linha #{linha}: #{conteudo}"
end
```

## Boas Práticas

```ruby
# Prefira map a each para transformações
# Ruim
resultados = []
numeros.each { |n| resultados << n * 2 }

# Melhor
resultados = numeros.map { |n| n * 2 }

# Use o iterador mais específico para sua necessidade
# Ruim
encontrado = nil
numeros.each do |n|
  if n > 5
    encontrado = n
    break
  end
end

# Melhor
encontrado = numeros.find { |n| n > 5 }
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Enumerable.html">Documentação do Enumerable</a>
        <a href="https://ruby-doc.org/core/Array.html">Documentação de Array</a>
    </category>
</seealso>