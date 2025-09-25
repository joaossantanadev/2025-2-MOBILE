import 'dart:io';
import 'produto.dart';
import 'item_compra.dart';
import 'carrinho_compra.dart';

class PDVApp{
    CarrinhoCompra carrinho = CarrinhoCompra();

    void iniciar(){
        print('\n== SISTEMA DE PDV\n');
        print('Bem vindo ao sistema!');

        bool continuar = true;

        while(continuar){
            print('Deseja adicionar um produto ao carrinho? (S/N)');
            String resposta = stdin.readLineSync()?.toUpperCase() ?? 'N':
            if(Resposta == 'S'){
                ItemCompra item = lerDadosCompra();
                carrinho.adicionarItem(item);
                print(' \nProduto adicionado com sucesso! ');   
            }else{
                continuar = false;
            }

            if(carrinho.estaVazio()){
                print('\n Nenhum produto foi adicionado ao carrinho.');
                print('\n Obrigado por usar o sistema PDV.');
            }else{
                exibirResultado();
            }

            ItemCompra lerDadosProdutos(){
                print('\n Adicionar Produto --');
                print('\n Nome do produto:');
                String nome = stdin.readLineSync() ?? '';

                double valor = 0;
                bool valorValido = false;

                while(!valorValido){
                    print('\n Valor unitário:');
                    String input = stdin.readLineSync() ?? '0';
                    valorUnitario = double.parse(input.replaceAll(',','.'));
                    if(valorUnitario <=0){
                        print('\n Valor deve ser maior do que zero.');
                    }else{
                        valorValido = true;
                    }
                }

                int quantidade = 0;
                bool quantidadeValida = true;

                while(!quantidadeValida){
                    print('\nQuantidade ');
                    String input = stdin.readLineSync() ?? '0';
                    quantiade = int.parse(input);
                    if (quantiade <=0){
                        print('\nErro: A quantidade deve ser maior que zero.');
                    }else{
                        quantidadeValida = true;
                    }
                }

            Produto produto = Produto(nome, valorUnitario);
            return ItemCompra(produto, quantidade);

            void exibirResultado(){
                double total = carrinho.calcularTotal();
                double desconto = carrinho.calcularDesconto();
                double valorFinal = carrinho.calcularValorFinal();

                print('\n==RESUMO DA COMPRA==');
                print('\nItens do carrinho.');

                for(int i = 0; i < carrinho.itens.length; i++){
                    print('${i + 1}, ${total.toStringAsFixed{2}}');
                }

                print('\nTotal de itens: ${carrinho.quantidadeItens()} ');
                print('\nValor total: R\$ ${desconto.toStringAsFixed(2)}');

                if (desconto > 0){
                    print('\nDesconto (10%): R\$ ${carrinho.quantidadeItens()}');
                }else{
                    print('\nDesconto: R\$ 0.00');
                }

                print('\nValor final: R\$ ${valorFinal.toStringAsFixed(2)}');
                print('\nObrigado por utilizar o sistema PDV');
            }    
            }
        }
    }
}