# 📚 Learn Ruby - Documentação Interativa

![Ruby Version](https://img.shields.io/badge/Ruby-3.2.0-red)
![License](https://img.shields.io/badge/license-MIT-green)
![Build Status](https://img.shields.io/badge/build-passing-brightgreen)

Uma documentação moderna e interativa para aprender Ruby, criada com Writerside e mantida pela comunidade PunkDomus.

## 🚀 Características

- 📖 Documentação completa de Ruby
- 🎯 Exemplos práticos e interativos
- 🎨 Design moderno e responsivo
- 🌙 Modo escuro nativo
- 🔍 Busca integrada
- 📱 Suporte mobile

## 🛠️ Tecnologias

- JetBrains Writerside
- Ruby 3.2.0
- HTML/CSS customizado
- Google Analytics
- GitHub Actions

## 📦 Estrutura do Projeto

```
learn-ruby/
├── Writerside/
│   ├── cfg/
│   │   ├── buildprofiles.xml
│   │   ├── analytics.js
│   │   └── custom.css
│   └── topics/
│       ├── introduction.md
│       └── installation.md
├── scripts/
│   ├── main.sh
│   ├── push_remote_repo.sh
│   └── unzip_writerside.sh
└── docs/
    └── generated-docs/
```

## 🚀 Começando

### Pré-requisitos

- JetBrains Writerside
- Ruby 3.2.0+
- Git

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/punkdomus/learn-ruby.git
cd learn-ruby
```

2. Instale as dependências do Writerside:
```bash
# Abra o projeto no Writerside
# Instale os plugins necessários
```

3. Configure as variáveis de ambiente:
```bash
cp .env.example .env
# Edite .env com suas configurações
```

## 🔧 Desenvolvimento

### Build Local

```bash
# No diretório raiz do projeto
./scripts/main.sh
```

### Deploy

O deploy é automatizado via GitHub Actions quando há push na branch main.

## 📝 Contribuindo

1. Fork o projeto
2. Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📜 Convenções

### Commits

- `feat:` - Novas features
- `fix:` - Correções de bugs
- `docs:` - Alterações na documentação
- `style:` - Formatação, ponto e vírgula, etc
- `refactor:` - Refatoração de código
- `test:` - Adição/modificação de testes

### Documentação

- Use Markdown para todos os arquivos de documentação
- Siga o estilo definido em `custom.css`
- Inclua exemplos práticos em todos os tópicos

## 📚 Wiki

Para mais informações sobre o desenvolvimento, consulte nossa [Wiki](https://github.com/punkdomus/learn-ruby/wiki)

## 🤝 Contribuidores

<a href="https://github.com/punkdomus/learn-ruby/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=punkdomus/learn-ruby" />
</a>

## 📄 Licença

Este projeto está sob a licença MIT - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes

## 📞 Contato

- Website: [punkdomus.dev](https://punkdomus.dev)
- Twitter: [@punkdomus](https://twitter.com/punkdomus)
- Email: dev@punkdomus.dev

## 🙏 Agradecimentos

- JetBrains pela ferramenta Writerside
- Comunidade Ruby

---
Feito com ❤️ pela PunkDomus
