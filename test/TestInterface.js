var Interface = artifacts.require("./Interface.sol");

contract('Interface', function(accounts) {
  it("should send coin correctly", function() {
    var meta;

    // Get initial balances of first and second account.
    var account_one = accounts[0];
    var account_two = accounts[1];

    var amount = 100;

    return Interface.deployed().then(function(instance) {
      meta = instance;
      return meta.transferTo(account_two, {from: account_one, value: amount});
    }).then(function(balance) {
      return meta.offer.call({from: account_two});
    }).then(function(balance) {
      assert.equal(balance.valueOf(), amount, "Not");
    });
  });
  it("Should take away coin correctly", function() {
  var meta;

    // Get initial balances of first and second account.
    var account_one = accounts[0];
    var account_two = accounts[1];

    var amount = 100;

    return Interface.deployed().then(function(instance) {
      meta = instance;
      return meta.transferTo(account_two, {from: account_one, value: amount});
    }).then(function(balance) {
      return meta.takeAway.call(account_two, {from: account_one});
    }).then(function(balance) {
      assert.equal(balance.valueOf(), amount, "Not");
    });
  });
});
