# Decentralized Hospitality Guest Experience Optimization

A comprehensive blockchain-based solution for managing and optimizing guest experiences in the hospitality industry using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a decentralized approach to hospitality management, ensuring transparency, security, and enhanced guest experiences through blockchain technology.

## Smart Contracts

### 1. Guest Services Manager Verification (\`guest-services-manager.clar\`)
- **Purpose**: Validates and manages hospitality guest services managers
- **Key Features**:
    - Manager verification and registration
    - Manager details storage (name, hotel ID, verification date)
    - Manager activation/deactivation
    - Authorization controls

### 2. Reservation Management (\`reservation-management.clar\`)
- **Purpose**: Manages guest reservations in the hospitality system
- **Key Features**:
    - Create and manage reservations
    - Guest reservation tracking
    - Reservation status updates
    - Date validation
    - Multi-reservation support per guest

### 3. Service Coordination (\`service-coordination.clar\`)
- **Purpose**: Coordinates various guest services and requests
- **Key Features**:
    - Service type registration
    - Service request creation and management
    - Priority-based request handling
    - Staff assignment to requests
    - Request completion tracking

### 4. Experience Personalization (\`experience-personalization.clar\`)
- **Purpose**: Personalizes guest experiences based on preferences and history
- **Key Features**:
    - Guest preference management
    - Experience history tracking
    - Personalized recommendations
    - Preference learning from experiences
    - Communication preference settings

### 5. Satisfaction Tracking (\`satisfaction-tracking.clar\`)
- **Purpose**: Tracks and analyzes guest satisfaction
- **Key Features**:
    - Satisfaction rating submission
    - Guest satisfaction summaries
    - Service category rating averages
    - Feedback collection
    - Rating validation (1-5 scale)

## Architecture

\`\`\`
┌─────────────────────────────────────────────────────────────┐
│                    Guest Interface                          │
├─────────────────────────────────────────────────────────────┤
│  Reservation Management  │  Service Coordination           │
├─────────────────────────────────────────────────────────────┤
│  Experience Personalization  │  Satisfaction Tracking      │
├─────────────────────────────────────────────────────────────┤
│              Guest Services Manager Verification            │
├─────────────────────────────────────────────────────────────┤
│                    Stacks Blockchain                       │
└─────────────────────────────────────────────────────────────┘
\`\`\`

## Key Benefits

1. **Transparency**: All transactions and interactions are recorded on the blockchain
2. **Security**: Cryptographic security ensures data integrity
3. **Decentralization**: No single point of failure
4. **Personalization**: AI-driven experience customization
5. **Accountability**: Immutable record of service delivery
6. **Efficiency**: Automated service coordination

## Getting Started

### Prerequisites
- Stacks blockchain node or access to testnet
- Clarity CLI tools
- Node.js and npm for testing

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd hospitality-blockchain
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

Deploy contracts to Stacks testnet:
\`\`\`bash
clarinet deploy --testnet
\`\`\`

## Usage Examples

### Manager Verification
\`\`\`clarity
(contract-call? .guest-services-manager verify-manager
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
"John Doe"
"HOTEL001")
\`\`\`

### Create Reservation
\`\`\`clarity
(contract-call? .reservation-management create-reservation
"RES001"
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
"HOTEL001"
"101"
u1000
u1005)
\`\`\`

### Submit Service Request
\`\`\`clarity
(contract-call? .service-coordination create-service-request
"REQ001"
"housekeeping"
"Extra towels needed"
u2)
\`\`\`

## Testing

The project includes comprehensive tests using Vitest:

- Unit tests for all contract functions
- Integration tests for contract interactions
- Error handling validation
- Edge case testing

Run tests with:
\`\`\`bash
npm run test
\`\`\`

## Security Considerations

- All contracts include proper authorization checks
- Input validation prevents invalid data
- Error handling provides clear feedback
- Read-only functions for safe data access
- Private functions for internal operations

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the repository or contact the development team.
