import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));
  try {
    // Fazendo transferência
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 300);

    // Observando resultado
    if (result) print("Transferência realizada com sucesso!");
  } on SendIdNotInvalidException catch (ex, stackTrace) {
    print('O id ${ex.senderId} não é válido');
    print('Pilha de execução: ');
    print('${stackTrace.toString()}');
  } on ReceiverIdInvalidException catch (ex, stackTrace) {
    print('O id ${ex.idReceiver} não é válido');
    print('Pilha de execução: ');
    print('${stackTrace.toString()}');
  } on SenderNotAuthenticatedException catch (ex, stackTrace) {
    print('A conta com o id ${ex.senderId} não está autenticada');
    print('Pilha de execução: ');
    print('${stackTrace.toString()}');
  } on SenderBalanceLowerThenException catch (ex, stackTrace) {
    print(
      'A conta com o id ${ex.senderId} tentou enviar R\$ ${ex.amount} possuindo um saldo de R\$ ${ex.senderBalance}',
    );
    print('Pilha de execução: ');
    print('${stackTrace.toString()}');
  } catch (ex) {
    print('Erro Inesperado');
    print('Tipo do erro ${ex.runtimeType}');
  }
}
