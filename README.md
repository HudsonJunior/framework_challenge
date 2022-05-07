# Framework - Challenge
Aplicativo construído como desafio técnico da Framework.

## Informações do projeto
- O projeto foi desenvolvido utilizando Flutter 2.10.
- Para executa-lo em sua máquina, basta clonar o projeto e rodar um `flutter pub get && flutter run`.
- Caso tenha problemas no build, experimente executar um `flutter clean` antes.

## Desenvolvimento
- O aplicativo contém as seguintes features:
  - Login via firebase (Google)
  - Listagem de items (maçã, pêra, banana, abacaxi e manga)
  - Busca por um produto
  - Carrinho de compras com os itens que o usuário selecionou
  - É possível adicionar e remover itens do carrinho.
  - Botão de checkout, gera um PDF contendo o "comprovante" do pedido.
  - Tela de conta do usuário com opção de logout.
  - Internacionalização da aplicação em Inglês e Português.
  - Testes unitários para algumas classes
  
- O desenvolvimento seguiu padrões do Clean Architecture, e foi dividido como se segue:
  - Modularização da aplicação. Os módulos contidos na aplicação são o módulo de `home` e `cart`. Há também os módulos pertencentes ao core, que são `auth` e `firebase`.
  - Cada módulo, possui a seguinte divisão:
    - Data -> Contém as classes de acessos a dados. Aqui estão localizados os datasources e os repositories.
    - Domain -> Contém a lógica de negócio (usecase) e as interfaces para os repositories (Princípio da inversão de depêndencia, assim, mantemos o `domain` totalmente independente das outras camadas.
    - Presentation -> Lógica de apresentação. Aqui está as telas, widgets e tudo mais.   

- Para o gerenciamento de estado foi utilizado o BLoC. Aplicando-se da utilização correta e renderizando apenas partes da árvore necessária, otimizando a performance do app.
- A criação da interface buscou-se utilizar de componentes avançados e que tornam a aplicação Flutter mais bonita, como por exemplo:
  - Slivers;
  - Hero;

- Prints das interfaces desenvolvidas:
![1651892614786](https://user-images.githubusercontent.com/37631682/167235619-38328cbd-e1ce-4411-a03f-d7fb2f838d8d.jpg)
![1651892614759](https://user-images.githubusercontent.com/37631682/167235589-ccf26b16-5b2f-4679-be2f-ee6b1d598203.jpg)![1651892614773](https://user-images.githubusercontent.com/37631682/167235597-1d619b03-5678-416f-bade-2545a6fe799d.jpg)
![1651892662973](https://user-images.githubusercontent.com/37631682/167235628-bf907afb-e97e-40b8-bcae-b0be1d1f7667.jpg)
![1651892614746 (1)](https://user-images.githubusercontent.com/37631682/167235634-18773a0d-4937-46e9-b15a-a02eed6524ff.jpg)

