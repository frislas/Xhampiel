// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importa contratos seguros de OpenZeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Contrato NFT de Xampiel
contract XampielNFT is ERC721, Ownable {

    uint256 public nextTokenId;
    string public baseTokenURI;

    constructor(string memory baseURI) ERC721("XampielNFT", "XAMPIEL") {
        baseTokenURI = baseURI;
    }

    // URI base donde estarán las fotos o metadatos de tus prendas
    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }

    // Función para crear (mintear) un nuevo NFT. Solo tú puedes hacerlo.
    function mintNFT(address to) public onlyOwner {
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }

    // Permite cambiar la base URI si cambias de servidor o almacenamiento
    function setBaseURI(string memory newBaseURI) public onlyOwner {
        baseTokenURI = newBaseURI;
    }
}
