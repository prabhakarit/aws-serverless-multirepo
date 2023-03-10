from yahooquery import Ticker

# It's incredibly easy to instantiate.  Just pass a symbol or list of symbols

# Instantiate with 'aapl' (Apple, Inc.)
aapl = Ticker('aapl')

# Multiple symbols can be passed as well
tickers = Ticker(['aapl', 'fb', 'msft', 'goog'])

# You can also pass multiple symbols as a string
tickers = Ticker('aapl fb msft goog', asynchronous=True)

# fast access to subset of stock info (opportunistic)
# View data available through the 'Summary' tab
summary_details = tickers.summary_detail

# summary_details is a dictionary
type(summary_details)

# Keys will be the symbols passed to the Ticker class
print(summary_details.keys())
# dict_keys(['aapl', 'fb', 'nflx', 'amzn', 'goog'])

# # The data available will be similar to what you see through the 'Summary' tab
# summary_details['aapl'].keys()
# dict_keys(
#     ['maxAge', 'priceHint', 'previousClose', 'open', 'dayLow', 'dayHigh',
#      'regularMarketPreviousClose', 'regularMarketOpen', 'regularMarketDayLow',
#      'regularMarketDayHigh', 'payoutRatio', 'beta', 'trailingPE', 'forwardPE',
#      'volume', 'regularMarketVolume', 'averageVolume', 'averageVolume10days',
#      'averageDailyVolume10Day', 'bid', 'ask', 'bidSize', 'askSize', 'marketCap',
#      'fiftyTwoWeekLow', 'fiftyTwoWeekHigh', 'priceToSalesTrailing12Months',
#      'fiftyDayAverage', 'twoHundredDayAverage', 'currency', 'fromCurrency',
#      'toCurrency', 'lastMarket', 'algorithm', 'tradeable'])

# # Financial data (cash flow, income statement, balance sheet) allows for arguments
# income_statement = faang.income_statement('q') # quarterly data

# Financial data (cash flow, income statement, balance sheet) allows for arguments
income_statement = tickers.income_statement('q') # quarterly data

print(income_statement)