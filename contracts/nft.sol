//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721Mintable.sol";
import"./
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0-solc-0.7/contracts/token/ERC20/ERC20.sol";

contract nft is ERC20{
    
// 1)function borrow: take an NFT as input (parameter)
// 2)what this function has to do? => everything: the 6 points!
// 3)lock it => transfer is not possible

bool public transferable = no;

constructor() ERC20("JavierToken", "JTK") {}

modifier isTransferable() {
    require(transferable == yes, 'Can Not Trade');
    _;
}

//function borrow(address _nftAddress) isTransferable external returns (bool) {

}



// 4)fetch the value. Search for the price field
//WHERE THE REAL PRICE OF AN NFT is shown IN ORDER TO FETCH IT?
// it is not a field.. https://docs.opensea.io/reference/asset-object
// and I do not know from where the NFT is coming, so the API wouldn´t know where to find the data.. 


// 5)generate token(mint ERC20 jToken and deploy it) => same amount of the NFT value
// who can mint?
// require jtokenAmount === nftAmount


function mint(uint amount) external {
    balanceOf[msg.sender] += amount;
    totalSupply += amount;
    emit Transfer(address(0), msg.sender, amount);
}


// 6)send the jToken to the sender wallet (msg.sender)

function transfer(address recipient, uint amount) external returns (bool) {
    balanceOf[msg.sender] -= amount;
    balanceOf[recipient] += amount;
    emit Transfer(msg.sender, recipient, amount);
    return true;
}