# DCA Investment Module

## Project Vision
DCA (Dollar-Cost Averaging) Investment is a Move module designed to automate periodic investments in a specified cryptocurrency. This module ensures disciplined investing by allowing users to set a fixed investment amount at regular intervals. By leveraging Move's secure and efficient transaction handling, the module facilitates seamless investment execution without requiring manual intervention.

## Features
- **Automated Investments**: Users can define an investment amount and interval, ensuring consistent investments over time.
- **Time-based Execution**: The module enforces a minimum interval between investments to adhere to the DCA strategy.
- **Secure Coin Transfers**: Investments are securely transferred using Aptos' standard coin transfer mechanisms.
- **Customizable Investment Parameters**: Users can specify the investment amount and frequency according to their preferences.

## Functions
### 1. Initialize DCA Investment
```move
public entry fun initialize<CoinType>(account: &signer, amount: u64, interval: u64)
```
- **Purpose**: Initializes a new DCA investment for the user.
- **Parameters**:
  - `account`: The signer who wants to set up the investment.
  - `amount`: The amount to invest in each interval.
  - `interval`: The minimum time (in seconds) between consecutive investments.
- **Operation**:
  - Stores the investment amount and interval in the user's account.
  - Sets the `last_investment_time` to the current timestamp.

### 2. Perform DCA Investment
```move
public entry fun invest<CoinType>(investor: &signer) acquires DCAInvestment
```
- **Purpose**: Executes the investment if the required interval has passed.
- **Parameters**:
  - `investor`: The signer initiating the investment.
- **Operation**:
  - Ensures the required interval has elapsed before investing.
  - Transfers the specified investment amount from the investor to their own account.
  - Updates the `last_investment_time` to track the latest investment.

## Error Handling
- `E_INSUFFICIENT_INTERVAL (1)`: Triggered if an investment attempt is made before the required interval has passed.

## How to Use
1. Deploy the module on the Aptos blockchain.
2. Call `initialize` to set up the investment parameters.
3. Periodically invoke `invest` to perform the scheduled investment.

By automating investments through this module, users can follow a disciplined approach to crypto investing while reducing market timing risks.

## Contract address
0x293a20ced15d0e400334dc1c8150d98e95dcbb4f9d5357abb89b14a8229ddeaa

![image](https://github.com/user-attachments/assets/6691dcd8-9f83-42a1-a8d3-883927b0d0b3)
