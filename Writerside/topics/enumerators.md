# Enumerators em Ruby

Enumerators são objetos que encapsulam a lógica de iteração, permitindo um controle mais fino sobre o processo de enumeração.

## Conceitos Básicos

### Criando Enumerators

```ruby
# Usando to_enum
array = [1, 2, 3]
enum = array.to_enum
puts enum.next  # => 1
puts enum.next  # => 2

# Usando enum_for
hash = { a: 1, b: 2 }
enum = hash.enum_for(:each)
puts enum.next  # => [:a, 1]
```

### Enumerator como Iterador Externo

```ruby
# Controle manual da iteração
letras = ['a', 'b', 'c'].to_enum
begin
  loop do
    puts letras.next
  end
rescue StopIteration
  puts "Iteração completa!"
end
```

## Métodos Comuns

### each_with_index

```ruby
# Criando enumerator com índice
enum = %w[primeiro segundo terceiro].each_with_index
puts enum.next  # => ["primeiro", 0]
puts enum.next  # => ["segundo", 1]
```

### with_index

```ruby
# Personalizando o índice inicial
enum = %w[a b c].each
enum.with_index(1) do |letra, indice|
  puts "#{indice}: #{letra}"
end
```

## Enumerators Especializados

### Infinite Sequences

```ruby
# Gerando sequência infinita
naturais = Enumerator.new do |y|
  n = 0
  loop do
    y << n
    n += 1
  end
end

puts naturais.take(5)  # => [0, 1, 2, 3, 4]
```

### Lazy Enumerators

```ruby
# Processamento preguiçoso
infinitos = (1..Float::INFINITY).lazy
pares = infinitos.select(&:even?)
puts pares.take(5).force  # => [2, 4, 6, 8, 10]
```

## Casos de Uso Práticos

### Processamento de Grandes Arquivos

```ruby
def ler_arquivo_lazy(arquivo)
  Enumerator.new do |yielder|
    File.open(arquivo) do |file|
      file.each_line do |linha|
        yielder << linha.chomp
      end
    end
  end
end

leitor = ler_arquivo_lazy("dados.txt")
puts leitor.take(3)  # Lê apenas as 3 primeiras linhas
```

### Paginação

```ruby
class Paginador
  def initialize(colecao, por_pagina)
    @colecao = colecao
    @por_pagina = por_pagina
  end

  def paginas
    Enumerator.new do |yielder|
      atual = @colecao
      until atual.empty?
        yielder << atual.take(@por_pagina)
        atual = atual.drop(@por_pagina)
      end
    end
  end
end

dados = (1..10).to_a
paginador = Paginador.new(dados, 3)
paginador.paginas.each { |pagina| p pagina }
```

## Combinando Enumerators

### Zip e Chain

```ruby
# Combinando sequências
letras = %w[a b c].to_enum
numeros = [1, 2, 3].to_enum

combinados = letras.zip(numeros)
puts combinados.to_a  # => [["a", 1], ["b", 2], ["c", 3]]
```

## Boas Práticas

```ruby
# Use Enumerator quando precisar de controle fino
def processar_em_lotes(colecao, tamanho)
  colecao.each_slice(tamanho).with_index do |lote, indice|
    puts "Processando lote #{indice + 1}"
    lote.each { |item| yield item }
  end
end

# Use lazy para coleções potencialmente infinitas
def numeros_primos
  Enumerator.new do |yielder|
    n = 2
    loop do
      yielder << n if primo?(n)
      n += 1
    end
  end.lazy
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Enumerator.html">Documentação de Enumerator</a>
        <a href="https://ruby-doc.org/core/Enumerator/Lazy.html">Documentação de Enumerator::Lazy</a>
    </category>
</seealso>