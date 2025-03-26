module sender::dca_investment {
    use std::signer;
    use aptos_std::coin;
    use aptos_std::timestamp;

    /// Errors
    const E_INSUFFICIENT_INTERVAL: u64 = 1;

    /// DCA Investment resource
    struct DCAInvestment<phantom CoinType> has key {
        investment_amount: u64,
        interval: u64,
        last_investment_time: u64,
    }

    /// Initialize DCA investment
    public entry fun initialize<CoinType>(
        account: &signer, 
        amount: u64, 
        interval: u64
    ) {
        move_to(account, DCAInvestment<CoinType> {
            investment_amount: amount,
            interval: interval,
            last_investment_time: timestamp::now_seconds()
        });
    }

    /// Perform DCA investment
    public entry fun invest<CoinType>(investor: &signer) acquires DCAInvestment {
        let investor_addr = signer::address_of(investor);
        let dca = borrow_global_mut<DCAInvestment<CoinType>>(investor_addr);
        
        // Check if enough time has passed
        assert!(
            timestamp::now_seconds() >= dca.last_investment_time + dca.interval, 
            E_INSUFFICIENT_INTERVAL
        );
        
        // Transfer coins to the investor's address
        coin::transfer<CoinType>(investor, investor_addr, dca.investment_amount);
        
        // Update last investment time
        dca.last_investment_time = timestamp::now_seconds();
    }
}
