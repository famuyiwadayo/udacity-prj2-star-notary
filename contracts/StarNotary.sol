// SPDX-License-Identifier: MIT
pragma solidity >=0.8.7;

//Importing openzeppelin-solidity ERC-721 implemented Standard
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// StarNotary Contract declaration inheritance the ERC721 openzeppelin implementation

contract StarNotary is ERC721 {
    // Star data
    struct Star {
        string name;
    }

    // Implement Task 1 Add a name and symbol properties
    // name: Is a short name to your
    // string public override name = "Star Note";
    // symbol: Is a short string like 'USD' -> 'American Dollar'
    // string public override symbol = "STRN";

    constructor() ERC721("Star Note", "STRN") {}

    // mapping the Star with the Owner Address
    mapping(uint256 => Star) public tokenIdToStarInfo;
    // mapping the TokenId and price
    mapping(uint256 => uint256) public starsForSale;

    // Create Star using the Struct
    function createStar(string memory _name, uint256 _tokenId) public {
        // Passing the name and tokenId as a parameters
        Star memory newStar = Star(_name); // Star is an struct so we are creating a new Star
        tokenIdToStarInfo[_tokenId] = newStar; // Creating in memory the Star -> tokenId mapping
        _mint(msg.sender, _tokenId); // _mint assign the the star with _tokenId to the sender address (ownership)
    }

    // Putting an Star for sale (Adding the star tokenid into the mapping starsForSale, first verify that the sender is the owner)
    function putStarUpForSale(uint256 _tokenId, uint256 _price) public {
        require(
            ownerOf(_tokenId) == msg.sender,
            "You can't sale the Star you don't owned"
        );
        starsForSale[_tokenId] = _price;
    }

    // Function that allows you to convert an address into a payable address
    function _makePayable(address x) internal pure returns (address) {
        // return address(uint160(x));
        return payable(x);
    }

    function buyStar(uint256 _tokenId) public payable {
        require(starsForSale[_tokenId] > 0, "The Star should be up for sale");
        uint256 starCost = starsForSale[_tokenId];
        address ownerAddress = ownerOf(_tokenId);
        require(msg.value > starCost, "You need to have enough Ether");
        // We can't use _addTokenTo or_removeTokenFrom functions, now we have to use _transferFrom
        _transfer(ownerAddress, msg.sender, _tokenId);
        // We need to make this conversion to be able to use transfer() function to transfer ethers
        // address ownerAddressPayable = _makePayable(ownerAddress);
        payable(ownerAddress).transfer(starCost);
        if (msg.value > starCost) {
            payable(msg.sender).transfer(msg.value - starCost);
        }
    }

    // Implement Task 1 lookUptokenIdToStarInfo
    function lookUptokenIdToStarInfo(
        uint _tokenId
    ) public view returns (Star memory) {
        //1. You should return the Star saved in tokenIdToStarInfo mapping
        return tokenIdToStarInfo[_tokenId];
    }

    // Implement Task 1 Exchange Stars function
    function exchangeStars(uint256 _tokenId1, uint256 _tokenId2) public {
        //1. Passing to star tokenId you will need to check if the owner of _tokenId1 or _tokenId2 is the sender
        //2. You don't have to check for the price of the token (star)
        //3. Get the owner of the two tokens (ownerOf(_tokenId1), ownerOf(_tokenId2)
        //4. Use _transferFrom function to exchange the tokens.

        require(ownerOf(_tokenId1) != address(0), "Owner of _tokenId1 cannot be a zero address");
        require(ownerOf(_tokenId2) != address(0), "Owner of _tokenId2 cannot be a zero address");
        require(_ownerIsSender(_tokenId1) || _ownerIsSender(_tokenId2), "Either _tokenId1 or _tokenId2 must be owned by the sender");

        address ownerOfToken1 = ownerOf(_tokenId1);
        address ownerOfToken2 = ownerOf(_tokenId2);

        _transfer(ownerOfToken1, ownerOfToken2, _tokenId1);
        _transfer(ownerOfToken2, ownerOfToken1, _tokenId2);
    }

    function _ownerIsSender(uint256 _tokenId) internal view returns (bool) {
        return ownerOf(_tokenId) == msg.sender;
    }

    // Implement Task 1 Transfer Stars
    function transferStar(address _to1, uint256 _tokenId) public {
        //1. Check if the sender is the ownerOf(_tokenId)
        //2. Use the transferFrom(from, to, tokenId); function to transfer the Star
        require(_to1 != address(0), "Address can't be a zero value");
        address ownerOfTok = ownerOf(_tokenId);
        require(
            ownerOfTok == msg.sender,
            "You can't transfer a Star you don't own"
        );
        transferFrom(ownerOfTok, _to1, _tokenId);
    }
}
