//+------------------------------------------------------------------+
//|                                                       tester.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                    [https://www.mql5.com](https://www.mql5.com/) |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "[https://www.mql5.com](https://www.mql5.com/)"
#property version   "1.00"


void drawMAs() {

     // Create arrays for moving averages
     double tenPeriodMArray[];
     double twentyPeriodMArray[];

     int tenperiodMA = iMA(_Symbol, PERIOD_D1, 10, 0, MODE_EMA, PRICE_CLOSE);
     int twentyPeriodMA = iMA(_Symbol, PERIOD_D1, 10, 0, MODE_EMA, PRICE_CLOSE);


}