// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.5.0;

import './pool/IGinsengSwapV3PoolImmutables.sol';
import './pool/IGinsengSwapV3PoolState.sol';
import './pool/IGinsengSwapV3PoolDerivedState.sol';
import './pool/IGinsengSwapV3PoolActions.sol';
import './pool/IGinsengSwapV3PoolOwnerActions.sol';
import './pool/IGinsengSwapV3PoolEvents.sol';

/// @title The interface for a GinsengSwap V3 Pool
/// @notice A GinsengSwap pool facilitates swapping and automated market making between any two assets that strictly conform
/// to the ERC20 specification
/// @dev The pool interface is broken up into many smaller pieces
interface IGinsengSwapV3Pool is
    IGinsengSwapV3PoolImmutables,
    IGinsengSwapV3PoolState,
    IGinsengSwapV3PoolDerivedState,
    IGinsengSwapV3PoolActions,
    IGinsengSwapV3PoolOwnerActions,
    IGinsengSwapV3PoolEvents
{

}
