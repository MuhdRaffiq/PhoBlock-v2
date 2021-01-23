package com.hackathon.phoblock.Utilities;

import org.web3j.crypto.Bip39Wallet;
import org.web3j.crypto.CipherException;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.Web3jService;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.core.methods.response.Web3ClientVersion;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.RawTransactionManager;
import org.web3j.tx.TransactionManager;
import org.web3j.tx.Transfer;
import org.web3j.utils.Convert;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.concurrent.ExecutionException;

public class EtherWeb3j {
    Web3j web3j;

    private final static BigInteger GAS_LIMIT = BigInteger.valueOf(6721975L);
    private final static BigInteger GAS_PRICE = BigInteger.valueOf(20000000000L);

    public EtherWeb3j(){
        this.web3j = Web3j.build(new HttpService("HTTP://127.0.0.1:7545"));
    }

    public void setWeb3j(Web3j web3j) {
        this.web3j = web3j;
    }

    public Web3j getWeb3j() {
        return web3j;
    }

    public String printWeb3ClientVersion(){
        Web3ClientVersion web3ClientVersion = null;

        try {
            web3ClientVersion = this.web3j.web3ClientVersion().send();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String str = web3ClientVersion.getWeb3ClientVersion();

        return str;
    }

    public void createWallet(String userPassword){
        try {
            Bip39Wallet wallet = WalletUtils.generateBip39Wallet(userPassword, new File("src/main/resources/out/WalletFile"));

            Credentials credentials = WalletUtils.loadBip39Credentials(userPassword, wallet.getMnemonic());

//            String walletFileName = WalletUtils.generateFullNewWalletFile(userPassword, new File("src/main/resources/out/WalletFile"));
//
//            String[] fetchAddress = walletFileName.split("--");
//            String getAddress = fetchAddress[fetchAddress.length - 1].split("\\.")[0];


//            System.out.println("Wallet Address: " + "0x" + getAddress);

//        } catch (NoSuchAlgorithmException e) {
//            e.printStackTrace();
//        } catch (NoSuchProviderException e) {
//            e.printStackTrace();
//        } catch (InvalidAlgorithmParameterException e) {
//            e.printStackTrace();
        } catch (CipherException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public double getEtherBalance(String accountAddress) {
        double retVal = 0.0;

        try {
            EthGetBalance ethGetBalance = this.web3j.ethGetBalance(accountAddress, DefaultBlockParameterName.LATEST).sendAsync().get();

            BigDecimal bigDecimal = Convert.fromWei(ethGetBalance.getBalance().toString(), Convert.Unit.ETHER);

            retVal =  bigDecimal.doubleValue();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        return retVal;
    }

    public Credentials getCredentialsFromWallet() throws IOException, CipherException {
        Credentials credentials = WalletUtils.loadCredentials("passphrase","wallet/path");

        return credentials;
    }

    public Credentials getCredentialsFromPrivateKey(String privateKey) {
        return Credentials.create(privateKey);
    }

    public void makeTransaction(String senderPrivateKey, String recipientWalletAddrs) throws Exception {
        TransactionManager transactionManager = new RawTransactionManager(
                getWeb3j(),
                getCredentialsFromPrivateKey(senderPrivateKey)
        );

        Transfer transfer = new Transfer(getWeb3j(), transactionManager);

        TransactionReceipt transactionReceipt = transfer.sendFunds(
                recipientWalletAddrs,
                new BigDecimal(0.1, MathContext.DECIMAL64),//BigDecimal.valueOf(0.1).toBigIntegerExact(),//BigDecimal.ONE,
                Convert.Unit.ETHER,
                GAS_PRICE,
                GAS_LIMIT
        ).send();
    }
}
