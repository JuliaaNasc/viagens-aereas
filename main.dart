import 'dart:io';
import 'dados_usuario.dart';
import 'lista_voos.dart';
import 'mostrar_menu.dart';

void main() {
  String nomeCompanhia = 'G4 FLEX AVIAÇÃO';
  print('');
  print('OLÁ SEJA MUITO BEM VINDO A NOSSA COMPANHIA AÉREA (${nomeCompanhia}):');
  print(
      '------------------------------------------------------------------------------------------');
  print('');
  print('INFORME O SEU NOME COMPLETO PARA O CADASTRO: ');
  dadosUsuario['nome_usuario'] = stdin.readLineSync()?.toUpperCase() ?? ' ';
  print('');

  print('QUAL A SUA IDADE ?:  ');
  String idade = stdin.readLineSync() ?? '1';
  dadosUsuario['idade'] = int.parse(idade);
  print('');

  if (dadosUsuario['idade'] < 16) {
    print('');
    print(
        '------------------------------------------------------------------------------------------');
    print(
        'SUA IDADE NÃO ESTÁ NA FAIXA ÉTARIA CORRETA PARA FAZER UMA COMPRA DE VIAGENS AÉREAS');
    print(
        'INFELIZMENTE A COMPANHIA NÃO PERMITE MENORES NA COMPRA DE PASSAGENS !!!');
    print('');
  } else {
    bool continuar = true;
    if (dadosUsuario['idade'] == 16 || dadosUsuario['idade'] == 17) {
      print(
          '------------------------------------------------------------------------------------------');
      print(
          'VOCÊ PODERÁ VIAJAR SEM O ACOMPANHAMENTO DE UM ADULTO, PORÉM AINDA COM AUTORIZAÇÃO: ');
      print(
          'DESEJA CONTINUAR, FAZENDO O CADASTRO DE AUTORIZAÇÃO PARA MENORES DE IDADE ENTRE (16 - 17 anos): SIM / NÃO ?');
      String respostaDeAutorizacao = stdin.readLineSync() ?? 'NÃO';

      if (respostaDeAutorizacao.toUpperCase() == 'SIM' ||
          respostaDeAutorizacao.toUpperCase() == 'S' ||
          respostaDeAutorizacao.toUpperCase() == 'SI') {
       print('');
        print('INFORME O NOME COMPLETO DO SEU RESPONSÁVEL ?: ');
        dadosUsuario['nome_responsavel'] =
            stdin.readLineSync()?.toUpperCase() ?? ' ';
        print('');
        print(
            'INFORME O CPF DO(a) SEU(sua) RESPONSÁVEL (${dadosUsuario['nome_responsavel']}) ?:');
        dadosUsuario['CPF_responsavel'] = stdin.readLineSync() ?? ' ';
        print('');
        print('INFORME O RG DO SEU RESPONSÁVEL (${
          dadosUsuario['nome_responsavel']
        })');
        dadosUsuario['RG_responsavel'] = stdin.readLineSync() ?? ' ';
        print('');
        print(
            'INFORME O ENDEREÇO DE MORADIA DO SEU RESPONSÁVEL (${dadosUsuario['nome_responsavel']}): ');
        dadosUsuario['endereco'] = stdin.readLineSync()?.toUpperCase() ?? ' ';
        print('');

        print(
            '------------------------------------------------------------------------------------------');

        print('INFORME O SEU CPF: (${dadosUsuario['nome_usuario']}) ?:');
        dadosUsuario['CPF_usuario'] = stdin.readLineSync() ?? ' ';
        print('');
        print('INFORME O SEU RG: (${dadosUsuario['nome_usuario']})');
        dadosUsuario['RG_usuario'] = stdin.readLineSync() ?? ' ';
        print('');
        print(
            'SEU ENDEREÇO É O MESMO DO SEU RESPONSÁVEL (${dadosUsuario['nome_responsavel']}) ?:');
        String respostaDeAutorizacao = stdin.readLineSync() ?? 'NÃO';

        if (respostaDeAutorizacao.toUpperCase() == 'SIM' ||
            respostaDeAutorizacao.toUpperCase() == 'S' ||
            respostaDeAutorizacao.toUpperCase() == 'SI')
             print('');
      } else {
        continuar = false;
      }
    }
    if (continuar) {
      print(
          'SUA IDADE ESTÁ NA FAIXA ÉTARIA CORRETA PARA FAZER UMA COMPRA DE VIAGENS AÉREAS');
      String mensagem = 'Olá, seja muito bem vindo(a) ';
      String mensagemDois = ' percebi que você tem ';

      print('');
      print('BOM TEMOS PACOTES PARA VOO NA COMPANHIA AÉRIA DE SUA ESCOLHA:  ');
      int meuMenu = mostrarMenu(['AZUL', 'GOL', 'LATAM', 'TODOS']);

      print('');
      print('VOCÊ PODE ESPECIFICAR QUE TIPO DE VOO DESEJA ?:');
      print(
          '------------------------------------------------------------------------------------------');
      int mostrarMenuSecundarioDois = mostrarMenu([
        'VOOS NACIONAIS',
        'VOOS INTERNACIONAIS',
        'TODOS OS VOOS DISPONIVEIS'
      ]);

    String? companhia = null;

      switch (meuMenu) {
        case 1:
        companhia = 'AZUL';
        break;
        case 2:
        companhia = 'GOL';
        break;
        case 3:
        companhia = 'LATAM';
        break;
        case 4:
        companhia = 'TODOS';
      }

      bool? internacional = null;

      switch (mostrarMenuSecundarioDois){
        case 1: 
        internacional = false;
        break;
        case 2:
        internacional = true;
        break;
      }

     List<Map> voos = listaDeVoos [companhia]; 
     List<Map> voosFiltrados = voos.where((mapa) => mapa['internacional'] == internacional).toList();

      for (Map mapa in voosFiltrados){
        print('VOOS DISPONIVEIS: ');
        print('');
        print('VOO DE (${mapa['origem']} --- ${mapa['destino']}) ESTÁ COM O VALOR DE ${mapa['valor_da_passagem']}, PARA A DATA DE SAÍDA ${mapa['data_de_saida']} as ${mapa['horario_de_saida']}, E A CHEGADA NA DATA ${mapa['data_de_chegada']} as ${mapa['horario_de_chegada']}, E ESTÁ ${mapa['bonus']}. (ESSE VOO TEM A QUANTIDADE DE CONEXÕES: ${mapa['conexão']}).');
        print('');
      }
     }
  }
}
