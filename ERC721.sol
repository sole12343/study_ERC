// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


//三个文件稍后依次阅读
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract GameItem is ERC721URIStorage {
    //NFT的本质 ： address---tokenid的映射
    //0x6E361Bd7eab67bcf10b86235E59f399c190111Cd -- [1,2,3]
    //图片？ 目前绝大部分项目图片都是存在ipfs这类的中心化服务器
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //构造函数 nft name , nft 缩写
    constructor() ERC721("BABA", "BA") {}

    //白名单player
    //URI 可以理解成URL
    function awardItem(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        //tokenID自增，因为不可重复
        _tokenIds.increment();

        //获取到自增的tokenID
        uint256 newItemId = _tokenIds.current();

        //铸造nft 地址-tokenID
        _mint(player, newItemId);

        //设置token相关信息
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
