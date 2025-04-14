# Condicionais em Ruby

As estruturas condicionais em Ruby permitem que seu código tome decisões e execute diferentes blocos de código baseados em condições específicas.

## if/else/elsif

### Sintaxe Básica

```ruby
if condicao
  # código executado se condição for verdadeira
elsif outra_condicao
  # código executado se outra_condição for verdadeira
else
  # código executado se nenhuma condição for verdadeira
end
```

### Exemplos Práticos

```ruby
def verificar_temperatura(temp)
  if temp >= 38
    "Febre alta"
  elsif temp >= 37
    "Febre baixa"
  else
    "Temperatura normal"
  end
end

# Forma modificadora (one-line)
puts "Está quente!" if temperatura > 30
```

## unless

### Sintaxe Básica

```ruby
unless condicao
  # código executado se condição for falsa
else
  # código executado se condição for verdadeira
end
```

### Exemplos Práticos

```ruby
def verificar_acesso(usuario)
  unless usuario.autenticado?
    "Acesso negado"
  else
    "Bem-vindo!"
  end
end

# Forma modificadora
exit unless File.exist?("config.yml")
```

## case/when

### Sintaxe Básica

```ruby
case expressao
when valor1
  # código para valor1
when valor2, valor3
  # código para valor2 ou valor3
else
  # código padrão
end
```

### Exemplos Práticos

```ruby
def classificar_nota(nota)
  case nota
  when 90..100
    "A"
  when 80...90
    "B"
  when 70...80
    "C"
  when 60...70
    "D"
  else
    "F"
  end
end

# Case com condições
def classificar_idade(idade)
  case
  when idade < 13
    "Criança"
  when idade < 20
    "Adolescente"
  when idade < 65
    "Adulto"
  else
    "Idoso"
  end
end
```

## Operador Ternário

### Sintaxe Básica

```ruby
condicao ? valor_se_verdadeiro : valor_se_falso
```

### Exemplos Práticos

```ruby
def status_conta(saldo)
  saldo >= 0 ? "Positivo" : "Negativo"
end

mensagem = idade >= 18 ? "Pode dirigir" : "Não pode dirigir"
```

## Boas Práticas

```ruby
# Evite aninhar muitos if/else
# Ruim
def verificar_usuario(usuario)
  if usuario
    if usuario.ativo?
      if usuario.admin?
        "Administrador"
      else
        "Usuário comum"
      end
    else
      "Usuário inativo"
    end
  else
    "Usuário não encontrado"
  end
end

# Melhor
def verificar_usuario(usuario)
  return "Usuário não encontrado" unless usuario
  return "Usuário inativo" unless usuario.ativo?
  
  usuario.admin? ? "Administrador" : "Usuário comum"
end

# Use case quando houver múltiplas condições
# Ruim
def traduzir_mes(mes)
  if mes == 1
    "Janeiro"
  elsif mes == 2
    "Fevereiro"
  elsif mes == 3
    "Março"
  # ...
  end
end

# Melhor
def traduzir_mes(mes)
  case mes
  when 1 then "Janeiro"
  when 2 then "Fevereiro"
  when 3 then "Março"
  # ...
  end
end
```

## Exemplos Avançados

```ruby
# Combinando condicionais
def validar_pedido(pedido)
  return false unless pedido && pedido.items.any?
  
  case
  when pedido.total > 1000 && pedido.cliente.vip?
    aplicar_desconto_vip(pedido)
  when pedido.items.size > 5 || pedido.total > 500
    aplicar_desconto_padrao(pedido)
  else
    pedido
  end
end

# Usando pattern matching (Ruby 2.7+)
def processar_resposta(resposta)
  case resposta
  in { status: 200, data: { nome: String => nome } }
    "Sucesso: #{nome}"
  in { status: 404 }
    "Não encontrado"
  in { status: Integer => code }
    "Erro: #{code}"
  else
    "Resposta inválida"
  end
end
```

## Tratamento de Nil

```ruby
# Usando &. (safe navigation operator)
def nome_usuario(usuario)
  usuario&.perfil&.nome || "Anônimo"
end

# Usando fetch com valor padrão
def configuracao(chave)
  config.fetch(chave) { valor_padrao(chave) }
end
```

<seealso>
    <category ref="external">
        <a href="https://ruby-doc.org/core/doc/syntax/control_expressions_rdoc.html">Documentação de Expressões de Controle</a>
        <a href="https://ruby-doc.org/core/doc/syntax/pattern_matching_rdoc.html">Documentação de Pattern Matching</a>
    </category>
</seealso>