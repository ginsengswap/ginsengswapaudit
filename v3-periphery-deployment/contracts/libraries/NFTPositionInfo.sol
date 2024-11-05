// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.7.6;

// import '@GinsengSwap/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol';
// import '@GinsengSwap/v3-core/contracts/interfaces/IGinsengSwapV3Factory.sol';
// import '@GinsengSwap/v3-core/contracts/interfaces/IGinsengSwapV3Pool.sol';

// import '@GinsengSwap/v3-periphery/contracts/libraries/PoolAddress.sol';

import '../../contracts/interfaces/INonfungiblePositionManager.sol';
import '../../v3-core/contracts/interfaces/IGinsengSwapV3Factory.sol';
import '../../v3-core/contracts/interfaces/IGinsengSwapV3Pool.sol';

import '../../contracts/libraries/PoolAddress.sol';

/// @notice Encapsulates the logic for getting info about a NFT token ID
library NFTPositionInfo {
    /// @param factory The address of the GinsengSwap V3 Factory used in computing the pool address
    /// @param nonfungiblePositionManager The address of the nonfungible position manager to query
    /// @param tokenId The unique identifier of an GinsengSwap V3 LP token
    /// @return pool The address of the GinsengSwap V3 pool
    /// @return tickLower The lower tick of the GinsengSwap V3 position
    /// @return tickUpper The upper tick of the GinsengSwap V3 position
    /// @return liquidity The amount of liquidity staked
    function getPositionInfo(
        IGinsengSwapV3Factory factory,
        INonfungiblePositionManager nonfungiblePositionManager,
        uint256 tokenId
    )
        internal
        view
        returns (
            IGinsengSwapV3Pool pool,
            int24 tickLower,
            int24 tickUpper,
            uint128 liquidity
        )
    {
        address token0;
        address token1;
        uint24 fee;
        (, , token0, token1, fee, tickLower, tickUpper, liquidity, , , , ) = nonfungiblePositionManager.positions(
            tokenId
        );

        pool = IGinsengSwapV3Pool(
            PoolAddress.computeAddress(
                address(factory),
                PoolAddress.PoolKey({token0: token0, token1: token1, fee: fee})
            )
        );
    }
}