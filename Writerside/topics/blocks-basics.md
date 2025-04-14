# Conceitos Básicos de Blocos

Os blocos são uma das características mais poderosas e fundamentais do Ruby. Eles representam trechos de código que podem ser passados para métodos como argumentos.

## Sintaxe de Blocos

### Duas Formas de Escrever

```ruby
# Usando chaves {} (recomendado para blocos de uma linha)
[1, 2, 3].each { |numero| puts numero }

# Usando do...end (recomendado para múltiplas linhas)
[1, 2, 3].each do |numero|
  dobro = numero * 2
  puts "O dobro de #{numero} é #{dobro}"
end
```

### Parâmetros de Bloco

```ruby
# Bloco sem parâmetros
3.times { puts "Olá!" }

# Bloco com um parâmetro
["a", "b", "c"].each { |letra| puts letra }

# Bloco com múltiplos parâmetros
hash = {nome: "Ruby", versao: "3.2"}
hash.each { |chave, valor| puts "#{chave}: #{valor}" }
```

## Métodos que Aceitam Blocos

### Yield

```ruby
# Método simples com yield
def saudacao
  puts "Antes do bloco"
  yield
  puts "Depois do bloco"
end

saudacao { puts "Dentro do bloco!" }

# Yield com parâmetros
def repetir(quantidade)
  quantidade.times do |i|
    yield i
  end
end

repetir(3) { |n| puts "Repetição #{n}" }
```

### Verificando Blocos

```ruby
# Usando block_given?
def executar
  if block_given?
    puts "Executando o bloco:"
    yield
  else
    puts "Nenhum bloco fornecido"
  end
end

executar { puts "Olá!" }
executar  # Sem bloco
```

## Escopo e Variáveis

### Variáveis Locais

```ruby
# Blocos podem acessar variáveis externas
valor = 10
[1, 2, 3].each do |numero|
  soma = numero + valor
  puts soma
end

# Variáveis de bloco não vazam para fora
[1, 2, 3].each do |numero|
  temp = numero * 2
end
# puts temp  # Isso geraria um erro
```

### Variáveis de Bloco

```ruby
# Parâmetros de bloco são locais ao bloco
total = 0
[1, 2, 3].each do |numero|
  total += numero
end
puts total  # => 6
```

## Exemplos Práticos

### Manipulação de Arquivos

```ruby
# Lendo um arquivo
def ler_arquivo(nome)
  File.open(nome, "r") do |arquivo|
    while linha = arquivo.gets
      yield linha if block_given?
    end
  end
end

ler_arquivo("dados.txt") do |linha|
  puts "Lendo: #{linha.chomp}"
end
```

### Temporizador Simples

```ruby
def medir_tempo
  inicio = Time.now
  yield
  fim = Time.now
  puts "Tempo decorrido: #{fim - inicio} segundos"
end

medir_tempo do
  # código a ser medido
  sleep(1)
end
```

## Boas Práticas

```ruby
# Use {} para blocos de uma linha
[1, 2, 3].map { |n| n * 2 }

# Use do...end para blocos multilinhas
[1, 2, 3].map do |n|
  dobro = n * 2
  dobro + 1
end

# Seja consistente com os nomes dos parâmetros
["ruby", "python"].each { |linguagem| puts linguagem }

# Evite blocos muito grandes
# Prefira extrair para métodos quando o bloco ficar complexo
def processar_dados(dados)
  dados.map { |item| transformar(item) }
end

def transformar(item)
  # lógica complexa aqui
end
```

## Exercícios Comuns

```ruby
# 1. Implementar um método que aceita um bloco
def repetir_mensagem
  yield if block_given?
end

# 2. Passar parâmetros para o bloco
def processar_lista(lista)
  lista.each { |item| yield item }
end

# 3. Combinar blocos com condicionais
def executar_se_valido(valor)
  if valor > 0
    yield valor
  else
    puts "Valor inválido"
  end
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/Proc.html">Documentação de Proc</a>
        <a href="https://ruby-doc.org/core/Kernel.html#method-i-block_given-3F">Documentação de block_given?</a>
    </category>
</seealso>