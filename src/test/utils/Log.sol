// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

function writeExpectRevert(uint256 value) {
    bytes32 slot = keccak256("ExpectSlot");
    // solhint-disable-next-line no-inline-assembly
    assembly {
        sstore(slot, value)
    }
}

function getExpectRevert() view returns (uint256 value) {
    bytes32 slot = keccak256("ExpectSlot");
    // solhint-disable-next-line no-inline-assembly
    assembly {
        value := sload(slot)
    }
}

function writeGasIdentifier(string memory id) {
    bytes32 slot = keccak256("GasIdentifierSlot");
    assembly {
        sstore(slot, id)
    }
}

function getGasIdentifier() view returns (string memory id) {
    bytes32 slot = keccak256("GasIdentifierSlot");
    assembly {
        id := sload(slot)
    }
}

library ModuleKitLogs {
    /* solhint-disable event-name-camelcase */
    event ModuleKit_NewAccount(address account, string accountType);
    event ModuleKit_Exec4337(address sender);

    event ModuleKit_AddExecutor(address account, address executor);
    event ModuleKit_RemoveExecutor(address account, address executor);

    event ModuleKit_AddValidator(address account, address validator);
    event ModuleKit_RemoveValidator(address account, address validator);

    event ModuleKit_SetFallback(address account, bytes4 functionSig, address handler);

    event ModuleKit_SetCondition(address account, address executor);

    /* solhint-enable event-name-camelcase */
}
