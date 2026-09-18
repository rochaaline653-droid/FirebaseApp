// Importa a biblioteca de testes do Flutter.
// Ela permite utilizar test(), expect(), isTrue e isFalse.
import 'package:flutter_test/flutter_test.dart';

// Cria um Map que relaciona:
// - String: nome do aluno
// - List<double>: lista de notas do aluno
//
// Cada aluno possui duas notas.
Map<String, List<double>> alunos = {

  // Aluna Maria com as notas 8.0 e 9.0.
  'Maria': [8.0, 9.0],

  // Aluna Bruna com as notas 7.0 e 7.0.
  'Bruna': [7.0, 7.0],

  // Aluna Carla com as notas 10.0 e 9.0.
  'Carla': [10.0, 9.0],
};

void main() {

  // Teste para adicionar um novo aluno ao Map.
  test('Adicionar elemento', () {

    // putIfAbsent() adiciona o aluno somente se a chave
    // ainda não existir no Map.
    alunos.putIfAbsent('Elena', () => [9.0, 8.0]);

    // Verifica se a chave 'Elena' foi adicionada.
    expect(alunos.containsKey('Elena'), isTrue);

    // Verifica se Elena possui as notas 9.0 e 8.0.
    expect(alunos['Elena'], [9.0, 8.0]);
  });


  // Teste para adicionar vários alunos de uma vez.
  test('Adicionar outro dicionário', () {

    // addAll() adiciona vários pares chave/valor ao Map.
    alunos.addAll({

      // Adiciona Elena com suas notas.
      'Elena': [9.0, 8.0],

      // Adiciona Luiza com suas notas.
      'Luiza': [8.0, 9.0],
    });

    // Verifica se Elena está presente no Map.
    expect(alunos.containsKey('Elena'), isTrue);

    // Verifica se Luiza está presente no Map.
    expect(alunos.containsKey('Luiza'), isTrue);
  });


  // Teste para remover um aluno do Map.
  test('Remover elemento', () {

    // remove() remove o elemento utilizando sua chave.
    // Neste caso, remove a aluna Bruna.
    alunos.remove('Bruna');

    // Verifica se Bruna não está mais presente no Map.
    expect(alunos.containsKey('Bruna'), isFalse);
  });


  // Teste para atualizar as notas de um aluno.
  test('Atualizar elemento', () {

    // update() permite alterar o valor associado a uma chave.
    // Neste caso, atualiza as notas da Carla.
    alunos.update('Carla', (value) => [9.0, 8.0]);

    // Verifica se as notas da Carla foram atualizadas.
    expect(alunos['Carla'], [9.0, 8.0]);


    // Outra forma de atualizar um valor do Map.
    // Aqui, as notas da Carla passam a ser 8.0 e 9.0.
    alunos['Carla'] = [8.0, 9.0];

    // Verifica se a atualização foi realizada corretamente.
    expect(alunos['Carla'], [8.0, 9.0]);
  });


  // Teste para percorrer e consultar os dados do Map.
 test('Testar percorrer dicionário', () {

  // Cria um Map específico para este teste.
  // Cada aluno possui duas notas.
  Map<String, List<double>> alunosTeste = {
    'Maria': [8.0, 9.0],
    'Carla': [8.0, 9.0],
    'Elena': [9.0, 8.0],
    'Luiza': [8.0, 9.0],
  };

  // Verifica se as chaves do Map estão corretas.
  // As chaves representam os nomes dos alunos.
  expect(
    alunosTeste.keys.toList(),
    ['Maria', 'Carla', 'Elena', 'Luiza'],
  );

  // Verifica se os valores do Map estão corretos.
  // Os valores representam as notas de cada aluno.
  expect(
    alunosTeste.values.toList(),
    [
      [8.0, 9.0],
      [8.0, 9.0],
      [9.0, 8.0],
      [8.0, 9.0],
    ],
  );

  // Cria uma variável para armazenar
  // a soma de todas as notas.
  double soma = 0;

  // Percorre todos os alunos e suas notas.
  alunosTeste.forEach((nome, notas) {

    // Percorre as notas de cada aluno.
    for (double nota in notas) {

      // Adiciona cada nota à soma.
      soma += nota;
    }
  });

  // Verifica se a soma de todas as notas é 68.0.
  expect(soma, 68.0);
});
test('Calcular médias', () {

  // Cria um Map contendo os alunos que serão utilizados
  // neste teste e suas respectivas notas.
  Map<String, List<double>> alunosTeste = {
    'Maria': [8.0, 9.0],
    'Carla': [8.0, 9.0],
    'Elena': [9.0, 8.0],
    'Luiza': [8.0, 9.0],
  };

  // Cria um Map vazio para armazenar as médias.
  Map<String, double> medias = {};

  // Percorre cada aluno e suas notas.
  alunosTeste.forEach((nome, notas) {

    // Variável utilizada para armazenar a soma das notas.
    double soma = 0;

    // Percorre todas as notas do aluno.
    for (double nota in notas) {

      // Soma cada nota.
      soma += nota;
    }

    // Calcula a média do aluno.
    double media = soma / notas.length;

    // Armazena a média utilizando o nome do aluno como chave.
    medias[nome] = media;
  });

  // Verifica se as médias calculadas estão corretas.
  expect(medias, {
    'Maria': 8.5,
    'Carla': 8.5,
    'Elena': 8.5,
    'Luiza': 8.5,
  });
});
 
}