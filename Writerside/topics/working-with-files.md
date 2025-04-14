# Trabalhando com Arquivos em Ruby

## Abrindo e Fechando Arquivos

### Métodos Básicos

```ruby
# Abrindo um arquivo (modo leitura)
arquivo = File.open('exemplo.txt', 'r')
conteudo = arquivo.read
arquivo.close

# Usando bloco (fecha automaticamente)
File.open('exemplo.txt', 'r') do |arquivo|
  conteudo = arquivo.read
end
```

### Modos de Abertura

```ruby
# Modos comuns
'r'  # Somente leitura
'w'  # Escrita (cria novo/sobrescreve)
'a'  # Anexar ao final
'r+' # Leitura e escrita
'w+' # Leitura e escrita (cria novo/sobrescreve)
'a+' # Leitura e anexar

# Exemplo com diferentes modos
File.open('log.txt', 'a') do |arquivo|
  arquivo.puts "Nova entrada: #{Time.now}"
end
```

## Leitura de Arquivos

### Lendo Conteúdo

```ruby
# Lendo arquivo inteiro
conteudo = File.read('arquivo.txt')

# Lendo linhas em array
linhas = File.readlines('arquivo.txt')

# Lendo linha por linha
File.foreach('arquivo.txt') do |linha|
  puts linha
end

# Lendo com encoding específico
conteudo = File.read('arquivo.txt', encoding: 'UTF-8')
```

### Técnicas de Leitura

```ruby
File.open('dados.txt', 'r') do |arquivo|
  # Lê primeiros 10 bytes
  dados = arquivo.read(10)
  
  # Lê próxima linha
  linha = arquivo.gets
  
  # Lê até encontrar padrão
  texto = arquivo.readline until texto =~ /fim/
  
  # Posicionamento no arquivo
  arquivo.seek(20, IO::SEEK_SET)
  arquivo.rewind  # Volta ao início
end
```

## Escrita em Arquivos

### Métodos de Escrita

```ruby
# Escrita simples
File.write('saida.txt', 'Olá, Mundo!')

# Anexando conteúdo
File.write('log.txt', 'Nova entrada\n', mode: 'a')

# Usando write e puts
File.open('dados.txt', 'w') do |arquivo|
  arquivo.write("Linha sem quebra")
  arquivo.puts("Linha com quebra")
  arquivo.printf("Formatado: %s\n", "texto")
end
```

### Escrita Estruturada

```ruby
# Escrevendo dados estruturados
dados = {nome: 'Ruby', versao: '3.2.0'}

File.open('config.txt', 'w') do |arquivo|
  dados.each do |chave, valor|
    arquivo.puts "#{chave}: #{valor}"
  end
end
```

## Manipulação de Arquivos

### Operações com Arquivos

```ruby
# Verificações
File.exist?('arquivo.txt')    # Existe?
File.directory?('pasta')      # É diretório?
File.file?('arquivo.txt')     # É arquivo?
File.zero?('vazio.txt')       # Está vazio?

# Informações
File.size('arquivo.txt')      # Tamanho em bytes
File.mtime('arquivo.txt')     # Data de modificação
File.dirname('path/arquivo.txt')  # Diretório
File.basename('path/arquivo.txt') # Nome do arquivo
```

### Manipulação de Diretórios

```ruby
# Criando diretórios
Dir.mkdir('nova_pasta')
FileUtils.mkdir_p('path/to/nested/folder')

# Listando arquivos
Dir.entries('.')              # Lista tudo
Dir['*.txt']                 # Com glob pattern
Dir.glob('**/*.rb')          # Recursivo

# Navegando em diretórios
Dir.chdir('nova_pasta') do
  # Trabalha no diretório
end
```

## Tratamento de Erros

```ruby
begin
  arquivo = File.open('inexistente.txt')
rescue Errno::ENOENT
  puts "Arquivo não encontrado!"
rescue Errno::EACCES
  puts "Permissão negada!"
ensure
  arquivo&.close
end
```

## Boas Práticas

```ruby
# Use blocos para garantir fechamento
def processar_arquivo(nome)
  File.open(nome, 'r') do |arquivo|
    yield arquivo
  end
end

# Backup antes de modificar
def atualizar_arquivo(nome)
  FileUtils.cp(nome, "#{nome}.bak")
  File.write(nome, novo_conteudo)
end

# Validação de arquivo
def arquivo_valido?(nome)
  File.file?(nome) && File.readable?(nome)
end
```

## Exemplos Práticos

```ruby
# Logger simples
class Logger
  def initialize(arquivo)
    @arquivo = arquivo
  end

  def log(mensagem)
    File.open(@arquivo, 'a') do |f|
      f.puts "#{Time.now} - #{mensagem}"
    end
  end
end

# Processador CSV
def processar_csv(arquivo)
  require 'csv'
  
  CSV.foreach(arquivo, headers: true) do |linha|
    yield linha
  end
end

# Leitor de configuração
def ler_config(arquivo)
  require 'yaml'
  YAML.load_file(arquivo)
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/File.html">Documentação de File</a>
        <a href="https://ruby-doc.org/core/Dir.html">Documentação de Dir</a>
        <a href="https://ruby-doc.org/stdlib/libdoc/fileutils/rdoc/FileUtils.html">Documentação de FileUtils</a>
    </category>
</seealso>