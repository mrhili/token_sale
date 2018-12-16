pragma solidity ^0.4.2;

contract DappToken {
  uint256 public totalSupply;
  string public name = 'Islamic coin';
  string public symbol = 'IC';
  string public standard = 'Islamic coin v1.0';

  event Transfer(address indexed _from,address _to,uint256 _value);
  event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

  mapping(address => uint256) public balanceOf;
  mapping(address => mapping(address => uint256)) public allowance;
  //constructor

  constructor( uint256 _initialSupply) public {
    balanceOf[ msg.sender ] = _initialSupply;
    totalSupply = _initialSupply;
  }

  function transfer(address _to, uint256 _value) public returns (bool success) {

    require(balanceOf[msg.sender] >= _value);

    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;



    emit Transfer(msg.sender, _to, _value);


    return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool success) {
      allowance[msg.sender][_spender] = _value;

      emit Approval(msg.sender, _spender, _value);

      return true;
  }




  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    
      require(_value <= balanceOf[_from]);
      require(_value <= allowance[_from][msg.sender]);

      balanceOf[_from] -= _value;
      balanceOf[_to] += _value;

      allowance[_from][msg.sender] -= _value;

      Transfer(_from, _to, _value);

      return true;
  }

  //Set constructor
  //Read total num of tokens
  /*
  address public owner;
  uint public last_completed_migration;

  constructor() public {
    owner = msg.sender;
  }

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
  */
}
