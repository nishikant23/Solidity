// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Demo {
    int  cnt1; //can hold +ve & -ve values
    uint cnt2; //only hold +ve values

    int v1 = -50; // -128 to 127
    uint v2 = 255; // 0 to 255
    int v3; // if not initialised to var bydefault sets to 0
    uint256 v4; //if not initialised to var bydefault sets to 0

    //Booleans
    bool flag = true; 
    bool check; // if not initialised then bydefault = false;

    //Address 
    //address public newAddr = "0xa9e24765605f2d465611a28aa4d2f8793cb3c134400744c4cd2bc";
    address public newAddr2; //not initilisied then by default "0x0000..."

    //Bytes
    //each bytes is acts as an bytes-type array, & bytes1= size-1, bytes2 = size-2, bytes100 = size-100
     //every char value has some HexaDecimal value
    bytes1 public arr1 = "a"; // size-1 bytes1 can only store 1-byte capacity-Char
    bytes3 public arr2 = "axt";
    bytes9 public myName = 'nishikant'; 
    bytes2 public arrNotInit; //not initialised bydefault store as per bytes-capacity hexadecimal no.

    bytes4 word = "Hate";
    function dealBytes() public view returns(bytes4) {
        //return word[2]; //only return word-arr 2th index char
        return word;
    } //bytes1, to only store bytres32
}

//contract acc: 0xd9145CCE52D386f254917e481eB44e9943F39138