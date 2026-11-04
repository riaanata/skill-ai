---
name: financial-data-pipeline
description: Process financial market data, parse OHLCV time-series candles, compute technical indicators (RSI, MACD, Bollinger Bands, MA), and prepare data for charting.
---

# Financial & Stock Market Data Pipeline

## 1. OHLCV Candle Structure & Validation
- Standardize all market candles to strict schema: `[timestamp, open, high, low, close, volume]`.
- Verify candle integrity:
  - `high` must be >= `low`, `open`, and `close`.
  - `low` must be <= `high`, `open`, and `close`.
  - `volume` must be >= 0.
- Handle timezone alignment: Always normalize candle timestamps to UTC internally; convert to local market time (e.g. WIB / Asia/Jakarta) only at the presentation layer.

## 2. Technical Indicator Computation Rules
- **Moving Averages (SMA & EMA):**
  - SMA: Simple rolling mean over N periods.
  - EMA: Multiplier `2 / (N + 1)`. Ensure sufficient warm-up period (at least 2x-3x the period length) for EMA stabilization.
- **RSI (Relative Strength Index):**
  - Standard period: 14. Use Wilder's smoothed moving average for gains and losses, not a simple moving average.
- **MACD (Moving Average Convergence Divergence):**
  - Fast EMA: 12, Slow EMA: 26, Signal EMA: 9.
  - Histogram = `MACD Line - Signal Line`.
- **Bollinger Bands:**
  - Middle: 20-period SMA. Upper/Lower: Middle +/- (2 * 20-period standard deviation).

## 3. Timeframe Resampling
- When aggregating lower timeframes (e.g., 1m to 5m, 15m, 1h, 1D):
  - `open`: First open of the bucket.
  - `high`: Maximum high of the bucket.
  - `low`: Minimum low of the bucket.
  - `close`: Last close of the bucket.
  - `volume`: Sum of all volumes in the bucket.

## 4. Charting Preparation
- Format output as lightweight JSON suitable for charting libraries (TradingView Lightweight Charts, Chart.js, or ApexCharts).
- Provide tabular numerical values with `tabular-nums` formatting to prevent layout jittering.
