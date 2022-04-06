pragma solidity >=0.5.0;

interface IGremlinCallee {
    function gremlinBorrow(
        address sender,
        address borrower,
        uint256 borrowAmount,
        bytes calldata data
    ) external;

    function gremlinRedeem(
        address sender,
        uint256 redeemAmount,
        bytes calldata data
    ) external;
}
