# Documentação para Rodar o Sistema

Esse sistema foi desenvolvido com as seguintes versões:

- [Flutter] Flutter 3.24.3
- [Android] SDK Android 21 para cima
- [Java JDK] Versão 17.0.10
- [Swift] Versão 5.10

## O processo exige a explicação dos pacotes utilizados no desenvolvimentos. Segue abaixo a lista de packages e a finalidade de cada um deles:
- 
- [dartz] Adicionei ao projeto para fazer tratamento de exceção e tratamento de erros, os quais ajudaram nos testes também.
- [mobx] Foi a gerência de estado solicitada no exame.
- [flutter_mobx] Faz a gerência de estado em conjunto com o mobx, utilizei para reatividade das telas.
- [mobx_codegen] Biblioteca para gerar codigos para o mobx.
- [dio] Pacote de requisições HTTP que já tenho costume de utilizar.
- [google_fonts] Trouxe o pacote para ter uma fonte mais elaborada na interface.
- [connectivity_plus] Utilizei para checar a conectividade do dispositivo e criar a splashscreen.
- [build_runner] Bibilioteca utilizada para executar o processo de geração de codigos do mobx.
- [get_it] Biblioteca solicitada para injeção de dependência.
- [mocktail] Biblioteca utilizada para realizar os testes unitários nas camadas.

Para o desenvolvimento, eu usei o sistema open-source que venho desenvolvendo para minha igreja, utilizei para ganhar tempo e reutilizar componentes.
O repositorio se encontra a baixo:

```bash
git clone https://github.com/victor-lustosa/ipbc-palmas-flutter.git
```

## Clonando o Repositório

Primeiro, clone o repositório do projeto usando o Git:

```bash
git clone https://github.com/victor-lustosa/act_desafio_pokedex.git
cd act_desafio_pokedex
```

na raiz do projeto, rode:

```bash
flutter pub get
```
agora acesse lib/main.dart.

se quiser, pode rodar direto, através do comando:

```bash
flutter run lib/main.dart
```
pra rodar o codigo do mobx:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```
## Arquitetura do Sistema, baseada em Clean Architecture

![alt text](https://github.com/victor-lustosa/act_desafio_pokedex/blob/main/docs/arquitetura.png)

