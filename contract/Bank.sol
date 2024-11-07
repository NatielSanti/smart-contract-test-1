// Указываем версию компилятора
pragma solidity ^0.8.0;

contract SimpleBank {
    // Адрес владельца контракта
    address public owner;

    // Балансы пользователей
    mapping(address => uint) public balances;

    // Инициализируем контракт, устанавливая владельца
    constructor() {
        owner = msg.sender;
    }

    // Функция для внесения средств на контракт
    function deposit() public payable {
        require(msg.value > 0, "not allowed to deposit less 0");
        balances[msg.sender] += msg.value;
    }

    // Функция для снятия средств
    function withdraw(uint amount) public {
        require(amount <= balances[msg.sender], "Not anought amount");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
