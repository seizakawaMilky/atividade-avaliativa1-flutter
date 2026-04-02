# Controle de Leitura

Esse projeto em Flutter é um controle de leitura, mostrando os últimos 5 livros lidos por um usuário, e permitindo também marcá-los como lidos completamente.
Feito em Flutter com Dart.

## Funcionalidades

Este projeto permite que o usuário efetue cadastro, login, e após o login acessar a página principal do app, mostrando a lista de livros, permitindo também marcá-los como lidos.

## Função das telas

Cadastro: Permite que o usuário insira um nome, um endereço de e-mail e uma senha, e que efetue cadastro com essas credenciais. A senha precisa obrigatoriamente ter 6 ou mais caracteres.
Login: Permite que o usuário digite seu e-mail e senha para efetuar login. Caso o e-mail e/ou a senha estiverem errados, o sistema não efetuará o login e irá mostrar uma mensagem de erro, permitindo apenas o login caso as credenciais estejam corretas.
Home: Após o login, a página principal irá mostrar o nome do usuário e a lista dos últimos 5 livros lidos. Também permite o usuário clicar em um botão para marcar os livros como lidos.

## Como executar
Após a instalação do Flutter e do Git, basta rodar o Git Bash na pasta do projeto, ou usar o próprio terminal do VSCode, rodando "flutter run".