//+------------------------------------------------------------------+
//|                                                       tester.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                    [https://www.mql5.com](https://www.mql5.com/) |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "[https://www.mql5.com](https://www.mql5.com/)"
#property version   "1.00"


MqlRates hourlyPriceArray[], dailyPriceArray[];
void OnTick() {
     /// MARK: - Daily Session Values
     ArraySetAsSeries(dailyPriceArray, true);
     int dailyData = CopyRates(_Symbol, PERIOD_D1, 0, 28, dailyPriceArray);
     double dailyOpenPrice = dailyPriceArray[0].open;
     double dailyHighPrice = dailyPriceArray[0].high;
     double dailyLowPrice = dailyPriceArray[0].low;
     datetime dailyOpenTime = dailyPriceArray[0].time;
     ObjectCreate(0, "dailyOpen", OBJ_VLINE, 0, dailyOpenTime, 0);
     ObjectCreate(0, "dailyHigh", OBJ_TREND, 0, dailyOpenTime, dailyHighPrice, dailyOpenTime + 86400, dailyHighPrice);
     ObjectCreate(0, "dailyLow", OBJ_TREND, 0, dailyOpenTime, dailyLowPrice, dailyOpenTime + 86400, dailyLowPrice);
     ObjectCreate(0, "dailyOpenPrice", OBJ_TREND, 0, dailyOpenTime, dailyOpenPrice, dailyOpenTime + 86400, dailyOpenPrice);



}