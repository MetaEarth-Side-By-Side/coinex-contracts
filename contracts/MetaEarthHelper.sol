// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * @author MetaEarth.sbs
 */

interface IMEST {
    function tokenIdToTiles(uint tokenId) external view returns(uint[] memory);
    function tileToTokenId(uint tileId) external view returns(uint);
    function tokenIdToName(uint tokenId) external view returns(string memory);
    function tokenOfOwnerByIndex(address owner, uint256 index)
        external
        view
        returns (uint256);
    function balanceOf(address owner)
        external
        view
        returns (uint256);
}

contract MESBSHelper {
    IMEST public MEST = IMEST(0x9d80De61175c5224D032203134Df3d5bC8d7faE5);
    function getEstates(address owner, uint from, uint num)
        public
        view
        returns (uint[] memory)
    {
        uint[] memory tokenIds = new uint[](num);
        for(uint i = 0; i < num; i++){
            uint tokenId = MEST.tokenOfOwnerByIndex(owner, i + from);
            tokenIds[i] = tokenId;
        }
        return tokenIds;
    }

    function getTokenIdOfTiles(uint[] memory tiles)
        public
        view
        returns (uint[] memory)
    {
        uint[] memory tokenIds = new uint[](tiles.length);
        for (uint i = 0; i < tiles.length; i++) {
            uint currentTile = tiles[i];
            tokenIds[i] = MEST.tileToTokenId(currentTile);
        }
        return tokenIds;
    }
    
    function getTilesFromTokenId(uint tokenId) public view returns(uint[] memory){
        return MEST.tokenIdToTiles(tokenId);
    }
}
