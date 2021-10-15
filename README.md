# Customização do shell com o Zsh

Repositório com os códigos e arquivos utilizados na apresentação
[Customizando o terminal com o Zsh](https://youtu.be/7p4uzb-tiRQ),
para o evento [Hacktoberfest Home Edition
2.0](https://opendevufcg.org/hacktoberfest/) realizado pelo
[OpenDevUFCG](https://opendevufcg.org/) no ano de 2021.

## Como utilizar

Baixe e entre no repositório:

```bash
git clone --recurse-submodules https://github.com/iagotito/customizacao-zsh
cd customziacao-zsh
```

Mova os arquivos `.zshenv` e `aliases` para a sua home:

```bash
mv .zshenv ~/.zshenv
mv aliases ~/aliases
```

Mova o diretório `zsh/` para o diretório `~/.config`:

```bash
mv zsh ~/.config/zsh
```

Reinicie o zsh (feche e abra o terminal).

## Descrição dos arquivos

### .zshenv

Arquivo de exportação de variáveis de ambiente para o resto do sistema.

Nele é definido, entre outras coisas, o `ZDOTDIR`, que é o diretório
onde estarão o restantes das configurações do _Zsh_. O `ZDOTDIR` é
definido como estando em `~/.config/zsh`.

### zsh/

Diretório que contém as configurações do _Zsh_. Deve ser colocado no
diretório `~/.config/`.

### zsh/.zshrc

Configurações do shell interativo, ou seja, do shell que vemos.

Nele são feitas algumas configurações gerais (como definição de opções
do _Zsh_) e são carregados outros arquivos de configuração (como quando
é feito um `source` de outro arquivo).

### zsh/prompt/prompt.zsh

Arquivo de configuração do _prompt_.

### zsh/plugins/completion.zsh

Arquivo de configuração do sistema de _complete_ do _Zsh_.

Existem outras maneiras de se configurar o _completion_ do _Zsh_. Você
pode ler mais a respeito neste texto do [The Valuable
Dev](https://thevaluable.dev/): [A Guide
to the Zsh Completion With
Examples](https://thevaluable.dev/zsh-completion-guide-examples/)

### zsh/plugins/zsh-syntax-highlighting

Diretório do plugin
[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting).

### zsh/plugins

Aqui foi utilizado apenas 1 plugin (zsh-syntax-highlighting), mas
existem outros. Recomendo que procure por aí para ver se acha algo que
lhe agrade.

O perfil [zsh-users](https://github.com/zsh-users) no GitHub tem
algumas coisas bem legais.  
O [Awesome Zsh
Plugins](https://project-awesome.org/unixorn/awesome-zsh-plugins)
também tem vários plugins para o Zsh.

### aliases

Arquivo com os aliases.

Existem inúmeras outras ideias legais e úteis de aliases pra se
utilizar, dê uma procurada depois. ;)

## Links adicionais

Páginas citadas:
- [Zsh Prompt
  Expandion](https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html)
- [Oh My Zsh](https://ohmyz.sh/)

Leituras adicionais:
- [Configuring Zsh Without
  Dependencies](https://thevaluable.dev/zsh-install-configure-mouseless/):
  Neste texto é explicado basicamente tudo que foi apresentado. É uma
  boa porta de entrada para aprender sobre o Zsh.
- [Zsh Startup Files](https://zsh.sourceforge.io/Intro/intro_3.html)
- [Documentação do Zsh](https://zsh.sourceforge.io/Doc/Release/)

Para mais plugins, dê uma olhada em:
- [zsh-users](https://github.com/zsh-users)
- [Awesome Zsh
  Plugins](https://project-awesome.org/unixorn/awesome-zsh-plugins)

Sobre o Tmux:
- [What's tmux and How to Configure It: a Detailed
  Guide](https://thevaluable.dev/tmux-config-mouseless/)

[Minhas configurações](https://github.com/iagotito/dotfiles) (caso
tenha interesse, eu faço algumas coisas diferentes do que mostrei, mas
creio que dá pra entender com base no que eu ensinei).
