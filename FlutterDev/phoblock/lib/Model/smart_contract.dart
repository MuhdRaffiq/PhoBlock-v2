import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class SmartContract {
  // Client httpClient;
  // Web3Client ethClient;

  // SmartContract({this.httpClient, this.ethClient});

  //To call every function defined in smart contract
  static Future<DeployedContract> loadContract(String walletAddress) async {
    String abiPath = "assets/smartcontract/api.json";
    String abiCode = await rootBundle.loadString(abiPath);

    final contract = DeployedContract(ContractAbi.fromJson(abiCode, "Pho"),
        EthereumAddress.fromHex(walletAddress));

    return contract;
  }

  static Future<String> submit(Web3Client ethClient, String functionName,
      String privateKey, String walletAddress, List<dynamic> args) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);

    DeployedContract contract = await loadContract(walletAddress);

    final ethFunction = contract.function(functionName);

    var result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: ethFunction,
        parameters: args,
      ),
    );

    return result;
  }

  // To read the data or submit the transaction
  static Future<List<dynamic>> query(Web3Client ethClient, String functionName,
      String walletAddress, List<dynamic> args) async {
    final contract = await loadContract(walletAddress);
    final ethFunction = contract.function(functionName);
    final data = await ethClient.call(
      contract: contract,
      function: ethFunction,
      params: args,
    );

    return data;
  }

  static Future<String> sendCoin(Web3Client ethClient, String targetAddressHex,
      String privateKey, int amount) async {
    EthereumAddress address = EthereumAddress.fromHex(targetAddressHex);
    // uint in SmartContract means BigInt for us
    var bigAmount = BigInt.from(amount);
    // send coin transaction
    var response = await submit(ethClient, "sendCoin", privateKey,
        targetAddressHex, [address, bigAmount]);
    // hash of the transaction
    return response;
  }

  static Future<List<dynamic>> getBalance(
      Web3Client ethClient, String targetAddressHex) async {
    EthereumAddress address = EthereumAddress.fromHex(targetAddressHex);
    // Get Balance Transaction
    List<dynamic> result =
        await query(ethClient, "getBalance", targetAddressHex, [address]);

    return result;
  }
}
