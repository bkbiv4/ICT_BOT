//+------------------------------------------------------------------+
//|                                               dailypriceinfo.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+

MqlRates dailyPriceArray[];



void drawDailyValues()
  {
   ArraySetAsSeries(dailyPriceArray, true);
   int dailyData = CopyRates(_Symbol, PERIOD_D1, 0, 28, dailyPriceArray);
   double dailyOpenPrice = dailyPriceArray[0].open;
   double dailyHighPrice = dailyPriceArray[0].high;
   double dailyLowPrice = dailyPriceArray[0].low;
   datetime dailyOpenTime = dailyPriceArray[0].time;
   
   ObjectCreate(0, "dailyHigh", OBJ_TREND, 0, dailyOpenTime, dailyHighPrice, dailyOpenTime + 86400, dailyHighPrice);
     ObjectCreate(0, "dailyLow", OBJ_TREND, 0, dailyOpenTime, dailyLowPrice, dailyOpenTime + 86400, dailyLowPrice);
     ObjectCreate(0, "dailyOpenPrice", OBJ_TREND, 0, dailyOpenTime, dailyOpenPrice, dailyOpenTime + 86400, dailyOpenPrice);

     ObjectCreate(0, "dailyHighText", OBJ_TEXT, 0, dailyOpenTime + 86400, dailyHighPrice);
     ObjectSetString(0, "dailyHighText", OBJPROP_TEXT, "Daily High");
     ObjectSetString(0, "dailyHighText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "dailyHighText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
     ObjectSetInteger(0, "dailyHighText", OBJPROP_FONTSIZE, 8);

     ObjectCreate(0, "dailyLowText", OBJ_TEXT, 0, dailyOpenTime + 86400, dailyLowPrice);
     ObjectSetString(0, "dailyLowText", OBJPROP_TEXT, "Daily Low");
     ObjectSetString(0, "dailyLowText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "dailyLowText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
     ObjectSetInteger(0, "dailyLowText", OBJPROP_FONTSIZE, 8);

     ObjectCreate(0, "dailyOpenPriceText", OBJ_TEXT, 0, dailyOpenTime + 86400, dailyOpenPrice);
     ObjectSetString(0, "dailyOpenPriceText", OBJPROP_TEXT, "Daily Open");
     ObjectSetString(0, "dailyOpenPriceText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "dailyOpenPriceText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
     ObjectSetInteger(0, "dailyOpenPriceText", OBJPROP_FONTSIZE, 8);
  }
void OnStart(void)
  {
   
  }