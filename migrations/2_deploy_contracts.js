var Identity = artifacts.require("./IdentityRegistry.sol");

module.exports = function(deployer) {
  deployer.deploy(Identity);
};
