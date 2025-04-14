# Iniciando sua Jornada no Submundo Ruby 

```ascii
     _____                 __  _                 
    / ___/___  ____  ____/ /_(_)___  ____ _____ 
    \__ \/ _ \/ __ \/ __  / / / __ \/ __ `/ __ \
   ___/ /  __/ / / / /_/ / / / / / / /_/ / / / /
  /____/\___/_/ /_/\__,_/_/_/_/ /_/\__, /_/ /_/ 
                                  /____/      
```

> "Todo hacker tem que começar de algum lugar. Geralmente é quebrando algo."
> - _Manual do Netrunner Iniciante_

## 🔌 Configurando seu Deck Cybernético

Antes de hackear a Matrix, você precisa preparar seu ambiente. Aqui está seu checklist de sobrevivência:

### Hardware Necessário
- Um computador (duh!)
- Teclado funcional (RGB opcional, mas recomendado para +10 de swag)
- Conexão com a internet (quanto mais rápida, menos tempo olhando para barras de progresso)

### Software Essencial
- Terminal (seu portal para o submundo)
- Editor de texto (Vim para os masoquistas, VSCode para os mortais)
- Ruby (obviamente, né?)
- Git (porque você não é um animal para não versionar código)

## 🎯 Objetivos desta Missão

```ascii
    ┌──────────────────────────────┐
    │   OBJETIVOS DA MISSÃO:       │
    │   ☐ Instalar Ruby           │
    │   ☐ Configurar Ambiente     │
    │   ☐ Primeiro Hack          │
    │   ☐ Não quebrar nada       │
    └──────────────────────────────┘
```

## 💉 Injetando Ruby no Sistema

Dependendo do seu OS (Sistema Operacional, para os novatos), o processo pode ser:

### 🪟 Windows (aka "O Sistema Corporativo")
```ruby
# 1. Baixe o instalador em ruby-lang.org
# 2. Next -> Next -> Next -> Finish
# 3. Reze para o deus do PATH
```

### 🐧 Linux (aka "O Sistema dos Hackers")
```bash
# Ubuntu/Debian
sudo apt-get install ruby-full

# Arch (para os verdadeiros cyberpunks)
sudo pacman -S ruby
```

### 🍎 macOS (aka "O Sistema dos Ricaços")
```bash
# Usando Homebrew (porque você é cool)
brew install ruby

# Ou use o rbenv, se você gosta de complicar
rbenv install 3.2.0
```

## 🧪 Testando o Setup

Abra seu terminal (ou Matrix prompt) e digite:

```ruby
ruby -v
```

Se você ver algo como `ruby 3.2.0p0`, parabéns! Você está oficialmente no jogo.

## 👾 Seu Primeiro Hack

Vamos fazer algo mais interessante que "Hello World". Abra seu editor e crie:

```ruby
# hack_the_planet.rb
def iniciar_sequencia_hack
  print "Iniciando sequência de hack"
  3.times { sleep 0.5; print "." }
  puts "\nAcesso garantido! A Matrix é sua!"
end

iniciar_sequencia_hack
```

## 🎮 Próximos Passos

Agora que você tem seu ambiente configurado, é hora de:

1. [Instalar as Ferramentas](installation.md) - Porque todo hacker precisa de seu arsenal
2. [Primeiros Passos](first-steps.md) - Aprenda a andar antes de correr pela Matrix
3. [Sintaxe Básica](basic-syntax.md) - As regras do jogo (que foram feitas para serem quebradas)

<seealso>
    <category ref="external">
        <a href="https://rvm.io">RVM - Para os indecisivos que querem todas as versões</a>
        <a href="https://bundler.io">Bundler - Seu gerenciador de dependências favorito</a>
    </category>
</seealso>

> **DICA DE SOBREVIVÊNCIA**: Mantenha café por perto. Muito café.

```ascii
        ☕
      \|/
   .------------------.
   |     CAFFEINE     |
   |    INJECTION     |
   |     SYSTEM      |
   '------------------'
```

## 🚨 Avisos Importantes

- Não tente hackear a NASA (ainda)
- Sim, você vai quebrar coisas
- Não, ctrl+z não resolve tudo
- Stack Overflow será seu melhor amigo

> "Se não está funcionando, tente `sudo`. Se ainda não funcionar, tente café."
> - _Sabedoria antiga dos mestres Ruby_