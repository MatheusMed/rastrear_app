# Rastrear App

Aplicativo desenvolvido em Flutter para consulta de rastreamento de encomendas através de integração com API externa.

## Sobre o projeto

O Rastrear App permite ao usuário informar um código de rastreio e visualizar de forma simples e organizada o status atual da entrega, incluindo o evento mais recente.

O projeto foi estruturado com foco em organização, separação de responsabilidades e boas práticas no consumo de APIs.

## Funcionalidades

- Consulta de rastreamento por código  
- Exibição do status da encomenda  
- Detalhes do evento mais recente (descrição, data e local)  
- Tratamento básico de erros de requisição  

## Tecnologias utilizadas

- Flutter  
- Dart  
- Dio (HTTP client)  
- GetIt (injeção de dependências)  
- ValueNotifier (gerenciamento de estado)  

## Estrutura

O projeto segue uma organização em camadas:

- **Controller**: gerencia o estado e a lógica da aplicação  
- **Repository**: responsável pelas requisições à API  
- **Model**: representação dos dados retornados  
- **UI (Pages)**: interface com o usuário  

## Como executar

```bash
git clone https://github.com/seu-usuario/rastrear_app.git
cd rastrear_app
flutter pub get
flutter run
