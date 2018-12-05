pragma solidity 0.4.25;


contract HarbergerTax { // TODO: is Marketplace
    struct TaxBalance { // Prepaid asset tax information
        uint balance; // Amount in ether
        uint lastCollectedAt; // Timestamp of last collection date
    }

    mapping(bytes32 => TaxBalance) public taxBalances;

    // Address where collected taxes are sent to
    address public taxRecipient;

    // Daily tax rate (there are no floats in solidity)
    uint32 public taxNumerator;
    uint32 public taxDenominator;

    constructor(
        address _taxRecipient,
        uint32 _taxNumerator,
        uint32 _taxDenominator
    ) public {
        taxRecipient = _taxRecipient;
        taxNumerator = _taxNumerator;
        taxDenominator = _taxDenominator;
    }

    // Asset owners calls this with Ether to deposit tax payments for a particular asset
    function deposit(bytes32 assetId) public payable {
        taxBalances[assetId].balance += msg.value;
    }

    // Withdraw tax payments, omitted for simplicity
    // function withdraw(bytes32 assetId, uint256 amount) public;    


    // Marketplace public marketplace; // Address of asset marketplace contract

    // function taxOwed(bytes32 assetId) public view returns (uint256) {
    //     uint assetPrice = marketplace.getPrice(assetId); // External contract call

    //     return assetPrice * (now - a.lastCollectedAt) * taxNumerator
    //         / taxDenominator / 1 days;
    // }

    // function collect(bytes32 assetId) public onlyCollector returns (bool) {
    //     TaxBalance storage taxBalance = taxBalances[assetId];
    //     uint taxes = taxOwed(assetId);

    //     if (taxes <= taxBalance.balance) {
    //         taxBalance.lastCollectedAt = now;
    //         taxBalance.balance -= taxes;
    //         taxRecipient.transfer(taxes) += tax;
    //         return true;
    //     } else {
    //         taxBalance.lastCollectedAt = now;
    //         taxBalance.balance = 0;
    //         _foreclose(bytes32 assetId); // foreclose asset
    //         return false;
    //     }
    // }

    // function _foreclose(bytes32 assetId) internal {
    //     Asset storage a = assets[assetId];
    //     a.owner = address(0); // Asset is now open for auction
    // }    
}