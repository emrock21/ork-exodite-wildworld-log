// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Exodite Wildworld Beast Encounter Log
/// @notice Records encounters with Exodite clans, megafauna mounts, and living ecosystems.
/// @dev This contract is exclusive to Exodite culture due to its faction-specific fields.

contract ExoditeWildworldLog {

    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Encounter {
        string clanName;        // Name of the Exodite tribe or clan
        string beastType;       // Type of megafauna mount (drake, saurid, thunder-beast)
        string terrainBond;     // How the ecosystem reacted or bonded during the encounter
        string behavior;        // How the Exodites acted
        string outcome;         // Result of the encounter
        address creator;
        uint256 approved;
        uint256 rejected;
        uint256 createdAt;
    }

    Encounter[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event EncounterRecorded(uint256 indexed id, string clanName, address indexed creator);
    event EncounterVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Encounter({
                clanName: "Example Exodite Clan (Fill your own below)",
                beastType: "Describe the megafauna mount.",
                terrainBond: "Describe how the living terrain responded.",
                behavior: "Describe how da feral pointy-ears acted.",
                outcome: "Describe how da wild scrap ended.",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordEncounter(
        string calldata clanName,
        string calldata beastType,
        string calldata terrainBond,
        string calldata behavior,
        string calldata outcome
    ) external {
        require(bytes(clanName).length > 0, "Clan required");

        logs.push(
            Encounter({
                clanName: clanName,
                beastType: beastType,
                terrainBond: terrainBond,
                behavior: behavior,
                outcome: outcome,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit EncounterRecorded(logs.length - 1, clanName, msg.sender);
    }

    function voteEncounter(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Encounter storage e = logs[id];

        if (approved) {
            e.approved += 1;
        } else {
            e.rejected += 1;
        }

        emit EncounterVoted(id, approved, e.approved, e.rejected);
    }

    function totalEncounters() external view returns (uint256) {
        return logs.length;
    }
}
