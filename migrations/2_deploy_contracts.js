var storage = artifacts.require("./Storage.sol");
var safeMath = artifacts.require("./SafeMath.sol");
var interfaceS = artifacts.require("./Interface.sol");

module.exports = function(deployer) {
  deployer.deploy(storage);
  deployer.deploy(interfaceS);
  deployer.deploy(safeMath);
};
