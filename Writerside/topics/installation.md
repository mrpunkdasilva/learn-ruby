# Equipando seu Arsenal Ruby

```ascii
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠾⠛⢉⣉⣉⣉⡉⠛⠷⣦⣄⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠋⣠⣴⣿⣿⣿⣿⣿⡿⣿⣶⣌⠹⣷⡀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣆⠉⠻⣧⠘⣷⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠈⠀⢹⡇⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⢸⣿⠛⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⢸⡇⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⠀⢿⡆⠈⠛⠻⠟⠛⠉⠀⠀⠀⠀⠀⠀⣾⠃⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣧⡀⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠃⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⠿⣦⣄⠀⠀⠀⠀⠀⠀⠀⣀⣴⠟⠁⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⡈⠀⠈⠙⠛⠶⠶⠶⠶⠛⠋⠁⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠘⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠃⠀⠀⠀⠀⠀
```

> "Um desenvolvedor sem suas ferramentas é como um samurai sem katana - precisa do equipamento certo para fazer um bom trabalho."
> - _Manual do Desenvolvedor Ruby_

## 🛠️ Kit de Desenvolvimento Essencial

### Editor de Código (Seu Ambiente Principal)

#### 💜 VSCode (Editor Moderno e Versátil)
```bash
# Windows/macOS
# Baixe em code.visualstudio.com

# Linux
sudo snap install code # Ubuntu
sudo pacman -S code # Arch Linux
```

Extensões Essenciais:
- Ruby
- Endwise (Fechamento automático de blocos)
- Ruby Solargraph (Autocompletar inteligente)

#### 🐱 Vim/Neovim (Editor Avançado)
```bash
# Instalação
sudo apt install neovim # Ubuntu
sudo pacman -S neovim # Arch Linux
brew install neovim # macOS
```

## 🔧 Gerenciadores de Versão

### RVM (Ruby Version Manager)
```bash
# Instalação básica
gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash
```

### rbenv (Alternativa Leve)
```bash
# macOS
brew install rbenv ruby-build

# Linux
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

## 💎 Gemas Essenciais

```ruby
# Gemas fundamentais para desenvolvimento
gem install bundler # Gerenciador de dependências
gem install rails # Framework web completo
gem install pry # Depurador interativo
gem install rubocop # Analisador de código
```

## 🧪 Testando sua Instalação

```ruby
# Crie um arquivo test_setup.rb
require 'bundler'
require 'rails'
require 'pry'

puts "✓ Bundler #{Bundler::VERSION}"
puts "✓ Rails #{Rails::VERSION::STRING}"
puts "✓ Ruby #{RUBY_VERSION}"
puts "\nInstalação concluída com sucesso!"
```

## 🎮 Configuração do Terminal

### Oh My Zsh (Personalização do Terminal)
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Temas Recomendados:
- Powerlevel10k (Interface moderna)
- Agnoster (Visual elegante)
- Dracula (Tema escuro profissional)

## 🚨 Resolução de Problemas Comuns

| Problema | Solução Padrão | Solução Alternativa |
|----------|----------------|--------------|
| "Comando não encontrado" | Adicionar ao PATH | Reiniciar o terminal |
| Permissão negada | `chmod +x` | `sudo !!` |
| Gem não instala | Verificar documentação | Consultar StackOverflow |
| Terminal não responde | Ctrl+C | Fechar e reabrir terminal |

## 📝 Checklist Final

```ascii
┌────────────────────────────┐
│ ✓ Ruby instalado          │
│ ✓ Editor configurado      │
│ ✓ Gemas básicas          │
│ ✓ Terminal personalizado  │
│ ✓ Ambiente pronto        │
└────────────────────────────┘
```

<seealso>
    <category ref="external">
        <a href="https://rvm.io/rvm/install">RVM - Guia Completo</a>
        <a href="https://github.com/rbenv/rbenv#installation">rbenv - Documentação</a>
        <a href="https://code.visualstudio.com/docs/languages/ruby">VSCode + Ruby</a>
    </category>
</seealso>

> **DICA PROFISSIONAL**: Mantenha um terminal aberto com `tail -f log/development.log` para monitoramento em tempo real do seu aplicativo.