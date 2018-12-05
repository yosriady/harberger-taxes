// const BN = require('bn.js');
// const { assertEvent, expectThrow, upgradable } = require('../helpers');

const RarePatron = artifacts.require('RarePatron');

contract('RarePatron', ([, other]) => {
  before(async () => {
    this.token = await RarePatron.new('My Rare Patron', 'MRP');
  });

  it('other accounts should be able to view token name', async () => {
    const name = await this.token.name({ from: other });
    assert.equal(name, 'My Rare Patron');
  });

  it('other accounts should be able to view token symbol', async () => {
    const symbol = await this.token.symbol({ from: other });
    assert.equal(symbol, 'MRP');
  });
});
