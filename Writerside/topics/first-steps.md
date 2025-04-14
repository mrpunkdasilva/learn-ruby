# Primeiros Passos com Ruby

```ascii
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣤⣤⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀
    ⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀
    ⠀⣴⣿⣿⣿⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣿⣿⣿⣿⣿⣷⡀⠀
    ⢸⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣧⠀
    ⢸⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⠀
    ⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⠀
    ⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⠀
    ⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⠀
    ⢸⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⠀
    ⠈⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⠀
    ⠀⠘⣿⣿⣿⣿⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀
    ⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀
    ⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠈⠙⠛⠛⠿⠿⠿⠿⠿⠿⠿⠿⠿⠛⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀
```

## Iniciando sua Jornada em Ruby

Bem-vindo ao seu primeiro contato prático com Ruby! Vamos começar com os fundamentos essenciais que todo desenvolvedor Ruby precisa conhecer.

### O Console Interativo (IRB)

O IRB (Interactive Ruby) é sua primeira ferramenta de experimentação:

```ruby
# Abra o terminal e digite
irb

# Experimente algumas operações básicas
2 + 2          #=> 4
"Ruby".upcase  #=> "RUBY"
[1, 2, 3].map { |n| n * 2 }  #=> [2, 4, 6]
```

### Seu Primeiro Programa Ruby

Crie um arquivo chamado `hello.rb`:

```ruby
# hello.rb
def saudacao(nome)
  "Olá, #{nome}! Bem-vindo ao mundo Ruby!"
end

# Testando nossa função
puts saudacao("Desenvolvedor")
```

Execute seu programa:
```bash
ruby hello.rb
```

### Estruturas Básicas

```ruby
# Variáveis
nome = "Ruby"
idade = 30
linguagens = ["Ruby", "Python", "JavaScript"]

# Condicionais
if idade >= 18
  puts "Maior de idade"
else
  puts "Menor de idade"
end

# Loops
linguagens.each do |lang|
  puts "Eu conheço #{lang}"
end
```

## Conceitos Fundamentais

### 1. Tudo é um Objeto
```ruby
# Até números são objetos
42.class          #=> Integer
42.to_s           #=> "42"
42.methods        #=> [lista de métodos disponíveis]
```

### 2. Blocos são Fundamentais
```ruby
# Diferentes formas de usar blocos
3.times { puts "Ruby!" }

3.times do |i|
  puts "Contagem: #{i + 1}"
end
```

### 3. Convenções Importantes

```ruby
# Nomes de variáveis e métodos: snake_case
primeiro_nome = "Ruby"
def calcular_total
  # código aqui
end

# Nomes de classes: CamelCase
class MinhaClasse
  # código aqui
end
```

## Exercícios Práticos

1. Calculadora Simples
```ruby
def calculadora(n1, n2, operacao)
  case operacao
  when "+"
    n1 + n2
  when "-"
    n1 - n2
  when "*"
    n1 * n2
  when "/"
    n1.to_f / n2
  else
    "Operação inválida"
  end
end
```

2. Lista de Tarefas
```ruby
class ListaTarefas
  def initialize
    @tarefas = []
  end

  def adicionar(tarefa)
    @tarefas << tarefa
    puts "Tarefa adicionada: #{tarefa}"
  end

  def listar
    @tarefas.each_with_index do |tarefa, index|
      puts "#{index + 1}. #{tarefa}"
    end
  end
end
```

## Próximos Passos

Após dominar estes conceitos básicos, você estará pronto para explorar:

1. [Sintaxe Básica](basic-syntax.md) - Aprofunde-se na linguagem
2. [Tipos de Dados](data-types.md) - Conheça as estruturas fundamentais
3. [Controle de Fluxo](control-structures.md) - Domine as estruturas de controle

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org">Documentação Oficial Ruby</a>
        <a href="https://www.ruby-lang.org/pt/documentation/quickstart">Guia Rápido Ruby</a>
    </category>
</seealso>

> **DICA**: Pratique no IRB! É a melhor forma de experimentar e aprender novos conceitos.