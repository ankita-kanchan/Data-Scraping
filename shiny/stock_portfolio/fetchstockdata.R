library(tidyquant)

tickers <- c("ITC","ICICIBANK.NS","TATASTEEL.NS","TATAMOTORS.NS")
benchmarks <- c("^NDX","^GSPC")

prices <- tq_get(tickers, 
                 get  = "stock.prices",
                 from = today()-months(12),
                 to   = today(),
                 complete_cases = F) %>%
  select(symbol,date,close)


bench <- tq_get(benchmarks,
                get  = "stock.prices",
                from = today()-months(12),
                to   = today()) %>%
  select(symbol,date,close)
bench