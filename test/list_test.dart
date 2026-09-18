// Importa a biblioteca de testes do Flutter.
// Ela fornece funções como test(), expect(), isTrue e isFalse.
import 'package:flutter_test/flutter_test.dart';

// Cria uma lista de números inteiros.
// Inicialmente, a lista possui os valores 1, 2 e 3.
List<int> numeros = [1, 2, 3];

void main() {

  // Teste para verificar a adição de um elemento na lista.
  test('Adicionar elemento', () {

    // Adiciona o número 4 ao final da lista.
    numeros.add(4);

    // Verifica se o número 4 está presente na lista.
    expect(numeros.contains(4), isTrue);
  });


  // Teste para verificar a adição de vários elementos de uma vez.
  test('Adicionar outra lista', () {

    // Adiciona os números 5 e 6 ao final da lista.
    numeros.addAll([5, 6]);

    // Verifica se o número 5 foi adicionado.
    expect(numeros.contains(5), isTrue);

    // Verifica se o número 6 foi adicionado.
    expect(numeros.contains(6), isTrue);
  });


  // Teste para adicionar um elemento em uma posição específica.
  test('Adicionar na posição', () {

    // Insere o número 0 na primeira posição da lista.
    // O índice 0 representa a primeira posição.
    numeros.insert(0, 0);

    // Verifica se o número 0 está realmente no índice 0.
    expect(numeros.indexOf(0), 0);
  });


  // Teste para remover um elemento pelo seu valor.
  test('Remover elemento', () {

    // Remove o número 2 da lista.
    numeros.remove(2);

    // Verifica se o número 2 não está mais na lista.
    expect(numeros.contains(2), isFalse);
  });


  // Teste para remover um elemento pela sua posição.
  test('Remover na posição', () {

    // Remove o elemento que está na primeira posição (índice 0).
    numeros.removeAt(0);

    // Verifica se o número 0 não está mais na lista.
    expect(numeros.contains(0), isFalse);
  });


  // Teste para verificar a quantidade de elementos da lista.
  test('Testar tamanho', () {

    // Verifica se a lista possui exatamente 5 elementos.
    expect(numeros.length, 5);
  });


  // Teste para verificar se a lista está vazia ou não.
  test('Testar vazio e não vazio', () {

    // Verifica se a lista NÃO está vazia.
    expect(numeros.isEmpty, isFalse);

    // Verifica se a lista possui algum elemento.
    expect(numeros.isNotEmpty, isTrue);
  });


  // Teste para verificar operações de ordenação da lista.
  test('Testar ordenação', () {

    // Cria uma nova lista com os elementos na ordem inversa.
    // reversed retorna os elementos do último para o primeiro.
    expect(numeros.reversed.toList(), [6, 5, 4, 3, 1]);

    // Verifica a ordem atual da lista.
    expect(numeros, [1, 3, 4, 5, 6]);

    // Inverte a ordem dos elementos da lista.
    numeros = numeros.reversed.toList();

    // Verifica se a lista está agora em ordem decrescente.
    expect(numeros, [6, 5, 4, 3, 1]);

    // Ordena a lista novamente em ordem crescente.
    numeros.sort();

    // Verifica se a lista voltou para a ordem crescente.
    expect(numeros, [1, 3, 4, 5, 6]);
  });


  // Teste para verificar como percorrer e transformar os elementos da lista.
  test('Testar percorrer lista', () {

    // Cria uma variável para armazenar a soma dos números.
    int soma = 0;

    // Percorre todos os elementos da lista.
    for (int numero in numeros) {

      // Adiciona cada número ao valor da variável soma.
      soma += numero;
    }

    // Verifica se a soma dos elementos é igual a 19.
    expect(soma, 19);


    // O método map() percorre a lista e modifica cada elemento.
    // Neste caso, cada número é multiplicado por 2.
    numeros = numeros.map((numero) => numero * 2).toList();

    // Verifica se os números foram multiplicados corretamente.
    expect(numeros, [2, 6, 8, 10, 12]);


    // O método where() filtra os elementos da lista.
    // Aqui são selecionados somente os números divisíveis por 3.
    numeros = numeros.where((numero) => numero % 3 == 0).toList();

    // Verifica se apenas os números 6 e 12 permaneceram.
    expect(numeros, [6, 12]);
  });
}
