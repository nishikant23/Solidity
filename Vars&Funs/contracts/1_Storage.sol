// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Demo {
    //this is the place to write a code here
    int public counter=15; // State var = costly-gas, Since, writeOnBkc, space/slot occupied wch stays frevr in bkc-mmry
    //all vars wriiten outside and inside sc is state var
    //Var delcratn & initialsn in solidity

    //local vars are always inside function
    // function localVar() public pure {
    //     int val = 120; //local var = 0-cost ReadOnBkc, not retuned hnc, pure
    //     //tempry use Stack or Heap mmry till function runs & not prmnt spc used.
    // }


    function writeStateVar() public {
        //writing the state var
        counter = 20; //updating counter to new value
    }

    function readStateVar() public view returns(int) {//returns=says actual-returning var's-Datatype
        return counter; //returns counter value
        //state var we only Reading, hence  'view'
    }

    function readAndWrite() public returns(int) {
        counter = 25; //Writing st-var
        return counter; //Reading st-var
        //if write & read both happened in funct Priority=Write then dont use 'view' 
    }

    function returnLocalVar() public pure returns(bool) {
        //st-var = priority, to read st-var use 'view' 
        //avoid 'pure' if reading both Local & state vars
        //pure = bcos i m not using any st-var in function
        bool value = true;
        return value;
    }
    function readStateAndLocalVar() public view returns(bool) {
        int localVar = counter;
        bool value = localVar > 0;
        return value;
    }
// DATA TPYES OF SOLIDITY
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
