# Strings em Ruby

As strings em Ruby são objetos que representam sequências de caracteres. São extremamente versáteis e oferecem uma grande variedade de métodos úteis.

## Criação de Strings

### Formas de Declaração

```ruby
# Aspas simples
nome = 'Ruby'

# Aspas duplas (permite interpolação)
versao = "3.2.0"
descricao = "#{nome} versão #{versao}"

# Heredoc (para strings multilinhas)
texto_longo = <<~TEXT
  Esta é uma string multilinha.
  Mantém a formatação
  e permite #{interpolacao}.
TEXT

# Strings com caracteres especiais
caminho = %q{C:\Users\Nome}  # Não interpreta caracteres especiais
comando = %Q{ruby -v}        # Interpreta caracteres especiais
```

## Interpolação

```ruby
nome = "Alice"
idade = 25

# Interpolação básica
mensagem = "#{nome} tem #{idade} anos"

# Interpolação com expressões
dobro_idade = "#{nome} terá #{idade * 2} anos em 25 anos"

# Interpolação com métodos
grito = "#{nome.upcase} ESTÁ GRITANDO!"
```

## Métodos Comuns

### Transformação

```ruby
texto = "ruby é incrível"

texto.upcase      # => "RUBY É INCRÍVEL"
texto.downcase    # => "ruby é incrível"
texto.capitalize  # => "Ruby é incrível"
texto.swapcase    # => "RUBY É INCRÍVEL"
texto.reverse     # => "levírcni é ybur"
```

### Busca e Substituição

```ruby
frase = "O Ruby é uma linguagem Ruby"

# Substituição
frase.sub('Ruby', 'Python')     # => "O Python é uma linguagem Ruby"
frase.gsub('Ruby', 'Python')    # => "O Python é uma linguagem Python"

# Busca
frase.include?('Ruby')          # => true
frase.start_with?('O')         # => true
frase.end_with?('Ruby')        # => true
frase.index('Ruby')            # => 2
```

### Manipulação

```ruby
# Split e Join
palavras = "ruby,python,javascript".split(',')  # => ["ruby", "python", "javascript"]
palavras.join(' e ')                           # => "ruby e python e javascript"

# Strip (remove espaços em branco)
"  ruby  ".strip      # => "ruby"
"  ruby  ".lstrip     # => "ruby  "
"  ruby  ".rstrip     # => "  ruby"

# Padding
"ruby".ljust(10)      # => "ruby      "
"ruby".rjust(10)      # => "      ruby"
"ruby".center(10)     # => "   ruby   "
```

## Comparação de Strings

```ruby
# Comparação básica
"ruby" == "ruby"      # => true
"ruby" === "ruby"     # => true
"ruby" <=> "python"   # => 1 (comparação lexicográfica)

# Ignorando case
"Ruby".casecmp?("ruby")    # => true
"Ruby".downcase == "ruby"  # => true
```

## Codificação e Encoding

```ruby
# Encoding
texto = "こんにちは"
texto.encoding        # => #<Encoding:UTF-8>
texto.encode('EUC-JP')  # Converte para EUC-JP

# Força encoding
texto.force_encoding('UTF-8')
```

## Exemplos Práticos

### Manipulação de Texto

```ruby
def formatar_nome(nome)
  # Remove espaços extras e capitaliza cada palavra
  nome.strip.split.map(&:capitalize).join(' ')
end

puts formatar_nome(" ada  lovelace ")  # => "Ada Lovelace"

def extrair_dominio(email)
  email.split('@').last
end

puts extrair_dominio("usuario@exemplo.com")  # => "exemplo.com"
```

### Validações Simples

```ruby
def email_valido?(email)
  email.include?('@') && 
  email.include?('.') && 
  !email.start_with?('@') && 
  !email.end_with?('.')
end

puts email_valido?("user@domain.com")  # => true
puts email_valido?("invalid.email")    # => false
```

### Formatação de Texto

```ruby
def formatar_cpf(cpf)
  numeros = cpf.gsub(/\D/, '')  # Remove não-dígitos
  "#{numeros[0..2]}.#{numeros[3..5]}.#{numeros[6..8]}-#{numeros[9..10]}"
end

puts formatar_cpf("12345678901")  # => "123.456.789-01"
```

## Performance e Boas Práticas

```ruby
# Uso eficiente de strings
# Ruim
string = ""
10.times { string = string + "a" }

# Bom
string = ""
10.times { string << "a" }  # Mais eficiente

# Freeze para strings imutáveis
CONSTANT_STRING = "não muda".freeze
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/String.html">Documentação Oficial de String</a>
        <a href="https://rubyapi.org/3.2/o/string">Ruby 3.2 String API</a>
    </category>
</seealso>