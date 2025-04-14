# Entrada e Saída em Ruby

Ruby oferece um conjunto robusto de ferramentas para manipulação de entrada e saída (I/O), permitindo interação com usuários, arquivos e streams de dados.

## Visão Geral

A entrada e saída em Ruby é baseada em streams, que são sequências de dados que podem ser lidas ou escritas. Os principais tipos são:

- **Entrada Padrão** (`STDIN`): Para ler dados do teclado
- **Saída Padrão** (`STDOUT`): Para exibir dados na tela
- **Saída de Erro** (`STDERR`): Para mensagens de erro
- **Arquivos**: Para persistência de dados

## Tópicos Principais

### [Entrada e Saída Básica](basic-io.md)
- Métodos `puts`, `print` e `p`
- Leitura com `gets`
- Formatação de strings
- Manipulação de entrada do usuário

### [Trabalhando com Arquivos](working-with-files.md)
- Leitura e escrita de arquivos
- Manipulação de diretórios
- Streams de dados
- Tratamento de erros

## Conceitos Fundamentais

```ruby
# Streams padrão
STDIN   # Entrada padrão
STDOUT  # Saída padrão
STDERR  # Saída de erro

# Aliases globais
$stdin  # Mesmo que STDIN
$stdout # Mesmo que STDOUT
$stderr # Mesmo que STDERR
```

## Hierarquia de Classes

```ascii
          IO
          │
    ┌─────┴─────┐
    │           │
   File      StringIO
```

## Casos de Uso Comuns

```ruby
# Entrada/Saída básica
puts "Digite seu nome:"
nome = gets.chomp
puts "Olá, #{nome}!"

# Manipulação de arquivos
File.open("dados.txt", "w") do |arquivo|
  arquivo.puts "Dados importantes"
end

# Redirecionamento de saída
$stdout = File.new("log.txt", "w")
puts "Isso vai para o arquivo"
$stdout = STDOUT # Restaura saída padrão
```

## Boas Práticas

- Sempre feche recursos abertos
- Use blocos com `File.open`
- Trate erros apropriadamente
- Valide entrada do usuário
- Forneça feedback claro

## Próximos Passos

Explore os subtópicos para aprender mais sobre:
- [Entrada e Saída Básica](basic-io.md)
- [Trabalhando com Arquivos](working-with-files.md)

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/IO.html">Documentação IO</a>
        <a href="https://ruby-doc.org/core/File.html">Documentação File</a>
    </category>
</seealso>