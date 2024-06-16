//+------------------------------------------------------------------+
//|                                              weeklypriceinfo.mqh |
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

MqlRates weeklyPriceArray[];

void drawWeeklyValues()
  {
   ArraySetAsSeries(weeklyPriceArray, true);
     int weeklyData = CopyRates(_Symbol,PERIOD_W1, 0, 16, weeklyPriceArray);
     double weeklyOpenPrice = weeklyPriceArray[0].open;
     ObjectCreate(0, "weeklyOpen", OBJ_TREND, 0, weeklyPriceArray[0].time, weeklyOpenPrice, weeklyPriceArray[0].time + 518400, weeklyOpenPrice);
     ObjectSetInteger(0, "weeklyOpen",OBJPROP_COLOR, clrPurple);
     ObjectCreate(0, "weeklyOpenLine", OBJ_VLINE, 0, weeklyPriceArray[0].time + 86400, 0);
     ObjectCreate(0, "weekOpenText", OBJ_TEXT, 0, weeklyPriceArray[0].time + 518400, weeklyOpenPrice);
     ObjectSetString(0, "weekOpenText", OBJPROP_TEXT, "Weekly Open");
     ObjectSetString(0, "weekOpenText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "weekOpenText", OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
     ObjectSetInteger(0, "weekOpenText", OBJPROP_FONTSIZE, 8);
  }