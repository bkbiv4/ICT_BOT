//+------------------------------------------------------------------+
//|                                             sessionpriceinfo.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#include "/../Include/dailypriceinfo.mqh"
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
datetime asianOpenTime, asianCloseTime, newyorkOpenTime, newyorkCloseTime, londonOpenTime, londonCloseTime;
double asianLow, asianHigh, londonLow, londonHigh, newyorkLow, newyorkHigh;
MqlRates asianPriceArray[], newyorkPriceArray[], londonPriceArray[]; 


void setSessionTimes() {
asianOpenTime = dailyPriceArray[0].time + 10800;
     asianCloseTime = asianOpenTime + 32400;
     londonOpenTime = dailyPriceArray[0].time + 36000;
     londonCloseTime = londonOpenTime + 32400;
     newyorkOpenTime = dailyPriceArray[0].time + 54000;
     newyorkCloseTime = newyorkOpenTime + 32400;
     }
     
     void drawAsianSession() {
     /// MARK: - Asian Session Values
     ArraySetAsSeries(asianPriceArray, true);
     
     int asianOpenBar = iBarShift(_Symbol, PERIOD_M1, asianOpenTime, false);
     int asianData = CopyRates(_Symbol, PERIOD_M1, asianOpenTime, asianCloseTime, asianPriceArray);
     
     double asianHighPrices[], asianLowPrices[];
     
     ArraySetAsSeries(asianHighPrices, true);
     ArraySetAsSeries(asianLowPrices, true);
     
     CopyHigh(_Symbol, PERIOD_M1, asianOpenTime, asianCloseTime, asianHighPrices);
     CopyLow(_Symbol, PERIOD_M1, asianOpenTime, asianCloseTime, asianLowPrices);
     
     int asianHighPrice = ArrayMaximum(asianHighPrices, 0);
     int asianLowPrice = ArrayMinimum(asianLowPrices, 0);
     
     
     
     asianHigh = asianPriceArray[asianHighPrice].high;
     asianLow = asianPriceArray[asianLowPrice].low;
     
     ObjectCreate(0, "asianBox", OBJ_RECTANGLE, 0, asianOpenTime, asianPriceArray[asianLowPrice].low, asianCloseTime, asianPriceArray[asianHighPrice].high);
     ObjectSetInteger(0, "asianBox",OBJPROP_BACK, true);
     ObjectSetInteger(0, "asianBox",OBJPROP_COLOR, C'177,0,177');
     ObjectSetInteger(0, "asianBox",OBJPROP_FILL, false);

     ObjectCreate(0, "asianSessionText", OBJ_TEXT, 0, asianOpenTime, asianHigh);
     ObjectSetString(0, "asianSessionText", OBJPROP_TEXT, "Asian Session");
     ObjectSetString(0, "asianSessionText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "asianSessionText", OBJPROP_ANCHOR, ANCHOR_LEFT_LOWER);
     ObjectSetInteger(0, "asianSessionText", OBJPROP_FONTSIZE, 8);
     ObjectSetInteger(0, "asianSessionText",OBJPROP_COLOR, C'177,0,177');
}

void drawLondonSession() {
     /// MARK: - London Session Values
     ArraySetAsSeries(londonPriceArray, true);
     
     int londonOpenBar = iBarShift(_Symbol, PERIOD_M1, londonOpenTime, false);
     int londonData = CopyRates(_Symbol, PERIOD_M1, londonOpenTime, londonCloseTime, londonPriceArray);
     
     double londonHighPrices[], londonLowPrices[];
     
     ArraySetAsSeries(londonHighPrices, true);
     ArraySetAsSeries(londonLowPrices, true);
     
     CopyHigh(_Symbol, PERIOD_M1, londonOpenTime, londonCloseTime, londonHighPrices);
     CopyLow(_Symbol, PERIOD_M1, londonOpenTime, londonCloseTime, londonLowPrices);
     
     int londonHighPrice = ArrayMaximum(londonHighPrices, 0);
     int londonLowPrice = ArrayMinimum(londonLowPrices, 0);
     
     londonHigh = londonPriceArray[londonHighPrice].high;
     londonLow = londonPriceArray[londonLowPrice].low;
     
     ObjectCreate(0, "londonBox", OBJ_RECTANGLE, 0, londonOpenTime, londonPriceArray[londonLowPrice].low, londonCloseTime, londonPriceArray[londonHighPrice].high);
     ObjectSetInteger(0, "londonBox",OBJPROP_BACK, true);   
     ObjectSetInteger(0, "londonBox",OBJPROP_COLOR, C'105,105,255');
     ObjectSetInteger(0, "londonBox",OBJPROP_FILL, false);

     ObjectCreate(0, "londonSessionText", OBJ_TEXT, 0, londonOpenTime, londonHigh);
     ObjectSetString(0, "londonSessionText", OBJPROP_TEXT, "London Session");
     ObjectSetString(0, "londonSessionText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "londonSessionText", OBJPROP_ANCHOR, ANCHOR_LEFT_LOWER);
     ObjectSetInteger(0, "londonSessionText", OBJPROP_FONTSIZE, 8);
     ObjectSetInteger(0, "londonSessionText",OBJPROP_COLOR, C'105,105,255');
}

void drawNewYorkSession() {
      /// MARK: - New York Session Values
     ArraySetAsSeries(newyorkPriceArray, true);
     
     int newyorkOpenBar = iBarShift(_Symbol, PERIOD_M1, newyorkOpenTime, false);
     int newyorkData = CopyRates(_Symbol, PERIOD_M1, newyorkOpenTime, newyorkCloseTime, newyorkPriceArray);
     
     double newyorkHighPrices[], newyorkLowPrices[];
     
     ArraySetAsSeries(newyorkHighPrices, true);
     ArraySetAsSeries(newyorkLowPrices, true);
     
     CopyHigh(_Symbol, PERIOD_M1, newyorkOpenTime, newyorkCloseTime, newyorkHighPrices);
     CopyLow(_Symbol, PERIOD_M1, newyorkOpenTime, newyorkCloseTime, newyorkLowPrices);
     
     int newyorkHighPrice = ArrayMaximum(newyorkHighPrices, 0);
     int newyorkLowPrice = ArrayMinimum(newyorkLowPrices, 0);
     
     newyorkHigh = newyorkPriceArray[newyorkHighPrice].high;
     newyorkLow = newyorkPriceArray[newyorkLowPrice].low;
     
     ObjectCreate(0, "newyorkBox", OBJ_RECTANGLE, 0, newyorkOpenTime, newyorkPriceArray[newyorkLowPrice].low, newyorkCloseTime, newyorkPriceArray[newyorkHighPrice].high);
     ObjectSetInteger(0, "newyorkBox",OBJPROP_BACK, true);
     ObjectSetInteger(0, "newyorkBox",OBJPROP_COLOR, clrSpringGreen);
     ObjectSetInteger(0, "newyorkBox",OBJPROP_FILL, false);

     ObjectCreate(0, "newyorkSessionText", OBJ_TEXT, 0, newyorkOpenTime, newyorkHigh);
     ObjectSetString(0, "newyorkSessionText", OBJPROP_TEXT, "New York Session");
     ObjectSetString(0, "newyorkSessionText", OBJPROP_FONT, "Arial");
     ObjectSetInteger(0, "newyorkSessionText", OBJPROP_ANCHOR, ANCHOR_LEFT_LOWER);
     ObjectSetInteger(0, "newyorkSessionText", OBJPROP_FONTSIZE, 8);
     ObjectSetInteger(0, "newyorkSessionText",OBJPROP_COLOR, clrSpringGreen);
}