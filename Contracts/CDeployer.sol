pragma solidity =0.5.16;

import "./Collateral.sol";
import "./interfaces/ICDeployer.sol";

/*
 * This contract is used by the Factory to deploy Collateral(s)
 * The bytecode would be too long to fit in the Factory
 */
 
contract CDeployer is ICDeployer {
	constructor () public {}
	
	function getCollateralHash() external pure returns (bytes32 salt) {
		bytes memory bytecode = type(Collateral).creationCode;
		return keccak256(abi.encodePacked(bytecode));
	} 
	function deployCollateral(address uniswapV2Pair) external returns (address collateral) {
		bytes memory bytecode = type(Collateral).creationCode;
		bytes32 salt = keccak256(abi.encodePacked(msg.sender, uniswapV2Pair));
		assembly {
			collateral := create2(0, add(bytecode, 32), mload(bytecode), salt)
		}
	}
}