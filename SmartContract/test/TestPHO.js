const PhoToken = artifacts.require("SampleToken");

var accounts;
var owner;

contract('PhoToken', (accs) => {
    accounts = accs;
    owner = accounts[0];
});

it ('it has the right token name and symbol', async() => {
    let instance = await PhoToken.deployed();
    let tokenName = await instance.name.call();
    let tokenSymbol = await instance.symbol.call();
    assert.equal(tokenName, "PhoBlock Token");
    assert.equal(tokenSymbol, "PHO") 
});

it ('can transfer and receive token from chosen account', async() => {
    let instance = await PhoToken.deployed();
    let mainWallet = owner;
    let user1 = accounts[1];
    let amountSend = 1;
    let balanceMainBefore = await instance.balanceOf(mainWallet);
    let balanceUser1Before = await instance.balanceOf(user1);
    await instance.approve(mainWallet, amountSend, {from: mainWallet});
    await instance.transferFrom(mainWallet, user1, amountSend);
    let balanceMainAfter = Number(balanceMainBefore) - amountSend;
    let balanceUser1After = Number(balanceUser1Before) + amountSend; 
    assert.equal(await instance.balanceOf(mainWallet), balanceMainAfter);
    assert.equal(await instance.balanceOf(user1), balanceUser1After);
});

it ('the sender (requestor) able to send token to the chosen wallet', async() => {
    let instance = await PhoToken.deployed();
    let mainWallet = owner;
    let user1 = accounts[1];
    let amountSend = 1;
    let balanceMainBefore = await instance.balanceOf(mainWallet);
    let balanceUser1Before = await instance.balanceOf(user1);
    await instance.transfer(user1, amountSend, {from: mainWallet}); 
    let balanceMainAfter = Number(balanceMainBefore) - amountSend;
    let balanceUser1After = Number(balanceUser1Before) + amountSend;
    assert.equal(await instance.balanceOf(mainWallet), balanceMainAfter);
    assert.equal(await instance.balanceOf(user1), balanceUser1After);
});

it ('has the right total supply of tokens', async() => {
    let instance = await PhoToken.deployed();
    let totalSupply = "1" + "0".repeat(24);
    let calledTotalSupply = await instance.totalSupply.call()
    assert.equal(Number(calledTotalSupply), totalSupply);
});