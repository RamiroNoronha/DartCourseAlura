import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety() {
  Account? myAccount;
  Random rng = Random();
  if (rng.nextInt(10) % 2 == 0) {
    myAccount = Account(name: 'Ramiro', balance: 500, isAuthenticated: true);
    if (rng.nextInt(10) % 2 == 0) {
      myAccount.createdAt = DateTime.now();
    }
  }

  // lidando com nulo quando o obj instanciado pode ser nulo forma 1
  if (myAccount != null) {
    print(myAccount.balance);
    if (myAccount.createdAt != null) {
      // Checar se é diferente de null e usa bang depois
      print(myAccount.createdAt!.day);
    }
  }
  // lidando com nulo quando o obj instanciado pode ser nulo forma 2
  print(myAccount != null ? myAccount.balance : "conta nula");

  // lidando com nulo quando o obj instanciado pode ser nulo forma 3
  print(myAccount?.balance);

  print(myAccount.runtimeType);
}

void main() {
  testingNullSafety();

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
        idSender: "Kako", idReceiver: "Ricarth", amount: 200);

    // Observando resultado
    if (result) print("Transferência realizada com sucesso!");
  } on SendIdInvalidException catch (ex, stackTrace) {
    print(ex);
    print('O id ${ex.senderId} não é válido');
    print('Pilha de execução: ');
    print('${stackTrace.toString()}');
  } on ReceiverIdInvalidException catch (ex, stackTrace) {
    print(ex);
    print('O id ${ex.idReceiver} não é válido');
    print('Pilha de execução: ');
    print('${stackTrace.toString()}');
  } on SenderNotAuthenticatedException catch (ex, stackTrace) {
    print(ex);
    print('A conta com o id ${ex.senderId} não está autenticada');
    print('Pilha de execução: ');
    print('${stackTrace.toString()}');
  } on ReceiverNotAuthenticatedException catch (ex, stackTrace) {
    print(ex);
    print('O id ${ex.idReceiver} não é válido');
    print('Pilha de execução: ');
    print('${stackTrace.toString()}');
  } on SenderBalanceLowerThenException catch (ex, stackTrace) {
    print(ex);
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
