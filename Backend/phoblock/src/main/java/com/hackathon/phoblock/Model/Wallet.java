package com.hackathon.phoblock.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.web3j.crypto.Bip39Wallet;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.utils.Convert;

import javax.persistence.*;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.concurrent.ExecutionException;

@Entity
@Table(name = "User_Wallet")
public class Wallet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column
    Bip39Wallet userWallet;
//    @OneToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "user_id", referencedColumnName = "id")
//    @OnDelete(action = OnDeleteAction.CASCADE)
//    @JsonIgnore
//    PhoBlockUser walletOwner;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Bip39Wallet getUserWallet() {
        return userWallet;
    }

    public void setUserWallet(Bip39Wallet userWallet) {
        this.userWallet = userWallet;
    }

    public Credentials getWalletCredentials(String userPassword){
        return WalletUtils.loadBip39Credentials(userPassword, this.userWallet.getMnemonic());
    }

    public String getWalletMnemonics(){
        return this.userWallet.getMnemonic();
    }

    public String getWalletAddress(String userPassword){
        return getWalletCredentials(userPassword).getAddress();
    }

    public BigInteger getWalletPrivateKey(String userPassword){
        ECKeyPair key = getWalletCredentials(userPassword).getEcKeyPair();

        return key.getPrivateKey();
    }

    public BigInteger getWalletPublicKey(String userPassword){
        ECKeyPair key = getWalletCredentials(userPassword).getEcKeyPair();

        return key.getPublicKey();
    }
}
