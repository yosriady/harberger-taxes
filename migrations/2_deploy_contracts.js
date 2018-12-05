const RarePatron = artifacts.require('RarePatron.sol');

module.exports = async (deployer) => {
  await deployer.deploy(RarePatron, 'MyRarePatron', 'MRP');
};
