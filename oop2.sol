pragma solidity = 0.8.22;

abstract contract Animal {
    function eat(string memory food) public virtual;
    function speak() public virtual returns (string memory);
}

abstract contract Herbivore is Animal {
    function eat(string memory food) public override {
        require(keccak256(abi.encodePacked(food)) == keccak256(abi.encodePacked("Plant")), "Herbivores can only eat plants");
    }
}

contract Cow is Animal, Herbivore {
    function speak() public override returns (string memory) {
        return "Mooo";
    }
}

contract Horse is Animal, Herbivore {
    function speak() public override returns (string memory) {
        return "Igogo";
    }
}

contract Wolf is Animal {
    function speak() public override returns (string memory) {
        return "Awoo";
    }

    function eat(string memory food) public override {
        require(keccak256(abi.encodePacked(food)) == keccak256(abi.encodePacked("Meat")), "Wolves can only eat meat");
    }
}

contract Dog is Animal {
    function speak() public override returns (string memory) {
        return "Woof";
    }

    function eat(string memory food) public override {
        require(
            keccak256(abi.encodePacked(food)) == keccak256(abi.encodePacked("Meat")) ||
            keccak256(abi.encodePacked(food)) == keccak256(abi.encodePacked("Plant")),
            "Dogs can only eat meat or plants"
        );
        require(keccak256(abi.encodePacked(food)) != keccak256(abi.encodePacked("Chocolate")), "Dogs cannot eat chocolate");
    }
}