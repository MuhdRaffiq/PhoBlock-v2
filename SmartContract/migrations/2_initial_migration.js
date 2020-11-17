//const { BN } = require("@openzeppelin/test-helpers");

var SampleToken = artifacts.require("SampleToken");

module.exports = function(deployer) {
  deployer.deploy(SampleToken, "PhoBlock Token", "PHO", "1" + "0".repeat(24));
};