//+------------------------------------------------------------------+
//|                                                          ICT.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                    [https://www.mql5.com](https://www.mql5.com/) |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "[https://www.mql5.com](https://www.mql5.com/)"
#property version   "1.00"

#include "Include/dailypriceinfo.mqh"
#include "Include/weeklypriceinfo.mqh"
#include "Include/sessionpriceinfo.mqh"
     
void OnTick(void) {
   drawDailyValues();
   drawWeeklyValues();
   setSessionTimes();
   drawSessions();
}
     
void drawSessions() {
     if (TimeCurrent() > newyorkOpenTime) {
          Print("1st");
          drawAsianSession();
          drawLondonSession();
          drawNewYorkSession();
     }
     else if (TimeCurrent() > londonOpenTime) {
          Print("2nd");
          drawAsianSession();
          drawLondonSession();
          newyorkOpenTime -= 86400;
          newyorkCloseTime -= 86400;
          drawNewYorkSession();
     }
     else if (TimeCurrent() > asianOpenTime) {
          Print("3rd");
          drawAsianSession();
          londonCloseTime -= 86400;
          londonOpenTime -= 86400;
          drawLondonSession();
          newyorkOpenTime -= 86400;
          newyorkCloseTime -= 86400;
          drawNewYorkSession();
     }
     else {
     Print("4th");
          asianOpenTime -= 86400;
          asianCloseTime -= 86400;
          Print(asianOpenTime, " ", asianCloseTime);
          
          drawAsianSession();
          londonCloseTime -= 86400;
          londonOpenTime -= 86400;
          drawLondonSession();
          newyorkOpenTime -= 86400;
          newyorkCloseTime -= 86400;
          drawNewYorkSession();
     }
}