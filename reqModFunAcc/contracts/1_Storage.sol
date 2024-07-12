// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    //If-else conditions
    function conditions(int a) public pure returns (int) {
        if(a>0) {
            return 0;
        } else if(a<0) {
            return -1;
        } else {
            return 1;
        }
    }

    //Require - Condition
    int256 public num;
    //int public a;
    function requireCheck(int _a) public returns (int256) {//'view' not-req, since writing st-var=num=_a;
        require(_a>0, "This is a -ve and Transact not done"); //if req(true) go to next lines of code
        //if require(false, do "....") Output :-  require-inside comment and "do ..." not deploy-contract.
        num = _a;
        return num;
    }

    /// MODIFIER
    modifier valueInRange(uint256 _value, uint256 _min, uint256 _max){
        require(_min<_value && _value<_max, "The entered value is Out of Range");
        _; //imp to write _--->refers blank any no. of lines of code execute after 'require' chk passed
    }

    function verifyInput(uint _inp) public valueInRange(_inp, 25, 250) pure returns(uint256) {
        return _inp*_inp;
    }

    /// Access Modifiers of FUNCTIONS
    function f1() public pure returns(string memory) { //can acces in-SM, derived-SM, outside-SM, outside-CODE 
        return " It is public fun-f1 -- ";
    }
    function f2() private pure returns(string memory) { //can access onluy inside SM
        return " It is private fun-f2 -- " ;
    }
    function f3() internal  pure returns(string memory) {// can access in-SM and its Derived(child)-SM
        return " It is internal fun-f3 -- ";
    }
    function f4() external pure returns(string memory) {//can access only outside-Codse -world
        return " It is external fun-f4 -- ";
    }

    function checkFunCall() public pure returns(string memory) {
        string memory result;
        string memory fun1= f1();
        string memory fun2= f2();
        string memory fun3= f3();
        //string memory fun4= f4(); //if u uncomment this 'external' f4() will not be accessible
        result = string(abi.encodePacked(fun1, fun2, fun3)); //to concat the strings of fun 1,2,3,
        return result;
    }

}
contract newConract {
    Storage obj = new Storage();
    string data = obj.f4();
    function returnExtFun() public view returns(string memory) {
        return data;
    }

}
contract child is Storage { //derived child contract
    string  x = f1();
    string  y = f3();
    
    function childReturnParentFun() public view returns(string memory){
        return string(abi.encodePacked(x, y));
    }
}