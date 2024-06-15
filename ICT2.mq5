//+------------------------------------------------------------------+
//|                                                         ICT2.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1
//--- the iMA plot
#property indicator_label1  "iMA"
#property indicator_type1   DRAW_LINE
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1

//input string startTradingTime = "09:00";
//input string endTradingTime = "16:30";
//input int dailyOpens = 0;
//input int weeklyOpens = 0;
//input bool ictKillzones = false;
input bool drawSessionBoxes = true;
MqlRates hourlyPriceArray[], dailyPriceArray[],  weeklyPriceArray[], asianPriceArray[], newyorkPriceArray[], londonPriceArray[]; 
datetime asianOpenTime, asianCloseTime, newyorkOpenTime, newyorkCloseTime, londonOpenTime, londonCloseTime;
double asianLow, asianHigh, londonLow, londonHigh, newyorkLow, newyorkHigh;
//int tenperiodMA;
//
//enum ICTZoneMethod {
//   Call_iMA,               // use iMA
//   Call_IndicatorCreate    // use IndicatorCreate
//};


void OnTick() {

     
    
     //create an array for several prices
   double myMovingAverageArray1[], myMovingAverageArray2[];
   
   //define the properties of  MAs - simple MA, 1st 24 / 2nd 50
   int movingAverage1 = iMA(_Symbol, _Period, 10, 0, MODE_EMA, PRICE_CLOSE);
   int movingAverage2 = iMA(_Symbol, _Period, 20,0,MODE_EMA,PRICE_CLOSE);
   
   //sort the price arrays 1, 2 from current candle
   ArraySetAsSeries(myMovingAverageArray1,true);
   ArraySetAsSeries(myMovingAverageArray2,true);
   
   //Defined MA1, MA2 - one line - currentcandle, 3 candles - store result
   //CopyBuffer(movingAverage1,0,0,3,myMovingAverageArray1);
   //CopyBuffer(movingAverage2,0,0,3,myMovingAverageArray2);
   
   //Check if we have a buy entry signal
//   if (
//      (myMovingAverageArray1[0]>myMovingAverageArray2[0])
//   && (myMovingAverageArray1[1]<myMovingAverageArray2[1])
//      )
//         {
//         Comment("BUY");
//         }
//    
//   //check if we have a sell entry signal      
//     if (
//      (myMovingAverageArray1[0]<myMovingAverageArray2[0])
//   && (myMovingAverageArray1[1]>myMovingAverageArray2[1])
//      )
//         {
//         Comment("SELL");
//         }          

     /// MARK: - Weekly Session Values
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

     /// MARK: - Daily Session Values
     ArraySetAsSeries(dailyPriceArray, true);
     int dailyData = CopyRates(_Symbol, PERIOD_D1, 0, 28, dailyPriceArray);
     double dailyOpenPrice = dailyPriceArray[0].open;
     double dailyHighPrice = dailyPriceArray[0].high;
     double dailyLowPrice = dailyPriceArray[0].low;
     datetime dailyOpenTime = dailyPriceArray[0].time;
     // ObjectCreate(0, "dailyOpen", OBJ_VLINE, 0, dailyOpenTime, 0);
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


     asianOpenTime = dailyPriceArray[0].time + 10800;
     asianCloseTime = asianOpenTime + 32400;
     londonOpenTime = dailyPriceArray[0].time + 36000;
     londonCloseTime = londonOpenTime + 32400;
     newyorkOpenTime = dailyPriceArray[0].time + 54000;
     newyorkCloseTime = newyorkOpenTime + 32400;
     
     ArraySetAsSeries(hourlyPriceArray, true);
     int hourlyData = CopyRates(_Symbol, PERIOD_H1, 0, 240, hourlyPriceArray); 

     /// MARK: - Judas Swing Values
     datetime judasOpenTime = dailyOpenTime + 25200;
     ObjectCreate(0,"judasOpenLine", OBJ_VLINE, 0, judasOpenTime, 0.0);
     ObjectSetInteger(0, "judasOpenLine", OBJPROP_COLOR, clrAzure);

     if (drawSessionBoxes) {
          drawSessions();
     }
//     
//     /// MARK: - ICT Killzones
//     if (ictKillzones) {
//          datetime ictNewYorkOpenTime = newyorkOpenTime - 3600;
//          datetime ictNewYorkCloseTime = ictNewYorkOpenTime + 7200;
//          
//          double ictNewYorkOpenPrice = 0.0;
//          for(ulong i = 0; i < hourlyPriceArray.Size(); i++) { 
//               if(hourlyPriceArray[i].time == ictNewYorkOpenTime) {
//                    ictNewYorkOpenPrice = hourlyPriceArray[i].high;
//               }
//          }
//          
//          datetime ictLondonCloseTime = londonCloseTime;
//          datetime ictLondonCloseOpenTime = ictLondonCloseTime - 7200;
//          
//          double ictLondonClosePrice = 0.0;
//          for(ulong i = 0; i < hourlyPriceArray.Size(); i++) { 
//               if(hourlyPriceArray[i].time == ictLondonCloseOpenTime) {
//                    ictLondonClosePrice = hourlyPriceArray[i].high;
//               }
//          }
//
//          ObjectCreate(0, "ictLondonCloseOpenTimeText", OBJ_TEXT, 0, (ictLondonCloseOpenTime + ictLondonCloseTime)/2, ictLondonClosePrice + 0.0015, ictLondonCloseTime, ictLondonClosePrice + 0.0015);
//          ObjectSetString(0, "ictLondonCloseOpenTimeText", OBJPROP_TEXT, "London Open");
//          ObjectSetInteger(0, "ictLondonCloseOpenTimeText",OBJPROP_COLOR, clrDodgerBlue);
//          ObjectSetInteger(0, "ictLondonCloseOpenTimeText",OBJPROP_FONTSIZE, 10);
//          ObjectSetInteger(0, "ictLondonCloseOpenTimeText", OBJPROP_ANCHOR, ANCHOR_CENTER);
//    
//          ObjectCreate(0, "ictLondonCloseOpenBox", OBJ_RECTANGLE, 0, ictLondonCloseOpenTime, ictLondonClosePrice + 0.0015 + 0.0002, ictLondonCloseTime, ictLondonClosePrice + 0.0015 - 0.0002);
//          ObjectCreate(0, "ictLondonCloseOpenBoxLeft", OBJ_TREND, 0, ictLondonCloseOpenTime, ictLondonClosePrice + 0.0015 + 0.0001, ictLondonCloseOpenTime, ictLondonClosePrice + 0.0015 - 0.0005);
//          ObjectCreate(0, "ictLondonCloseOpenBoxRight", OBJ_TREND, 0, ictLondonCloseTime, ictLondonClosePrice + 0.0015 + 0.0001, ictLondonCloseTime, ictLondonClosePrice + 0.0015 - 0.0005);
//
//          ObjectCreate(0, "ictNewyorkOpenText", OBJ_TEXT, 0, (ictNewYorkOpenTime + ictNewYorkCloseTime)/2, ictNewYorkOpenPrice + 0.0015, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015);
//          ObjectSetString(0, "ictNewyorkOpenText", OBJPROP_TEXT, "New York Open");
//          ObjectSetInteger(0, "ictNewyorkOpenText",OBJPROP_COLOR, clrDodgerBlue);
//          ObjectSetInteger(0, "ictNewyorkOpenText",OBJPROP_FONTSIZE, 10);
//          ObjectSetInteger(0, "ictNewyorkOpenText", OBJPROP_ANCHOR, ANCHOR_CENTER);
//
//          ObjectCreate(0, "ictNewyorkOpenBox", OBJ_RECTANGLE, 0, ictNewYorkOpenTime, ictNewYorkOpenPrice + 0.0015 + 0.0002, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015 - 0.0002);
//          ObjectCreate(0, "ictNewyorkOpenBoxLeft", OBJ_TREND, 0, ictNewYorkOpenTime, ictNewYorkOpenPrice + 0.0015 + 0.0001, ictNewYorkOpenTime, ictNewYorkOpenPrice + 0.0015 - 0.0005);
//          ObjectCreate(0, "ictNewyorkOpenBoxRight", OBJ_TREND, 0, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015 + 0.0001, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015 - 0.0005);
//     }

     
     
     
     
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


//Switch Case 
//     //On the chart set up clickable butttons to control the switch
//     //Use boolean to set up different modes



//ObjectCreate(0, "yesterdayLow", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].low, dailyPriceArray[0].time + 86400, dailyPriceArray[1].low);
     //ObjectCreate(0, "yesterdayHigh", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].high, dailyPriceArray[0].time + 86400, dailyPriceArray[1].high);
     //ObjectCreate(0, "yesterdayClose", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].close, dailyPriceArray[0].time + 86400, dailyPriceArray[1].close);
     //ObjectCreate(0, "yesterdayOpen", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].open, dailyPriceArray[0].time + 86400, dailyPriceArray[1].open);
     //ObjectSetInteger(0, "yesterdayLow",OBJPROP_COLOR, clrDodgerBlue);
     //ObjectSetInteger(0, "yesterdayHigh",OBJPROP_COLOR, clrDodgerBlue);
     //ObjectSetInteger(0, "yesterdayClose",OBJPROP_COLOR, clrWhite);
     //ObjectSetInteger(0, "yesterdayOpen",OBJPROP_COLOR, clrGray);



     /// MARK: - Weekly Smart Money

     /*
     Bullish Conditions - I will need to determine probabilities and different scenarios to choose a proper timeframe
     Create a Price array that spans weekly open time until Wednesday 7AM
     High Odds that the low will from before the above end date of the price array
     The odds are even greater between Tuesday 3AM and Wednesday 7AM
     Test and Find a higher timeframe moving average to help with directional bias
     Can also use a hourly or 30 minute moving average

     Map weekly opening
     */




//void OnDeinit(const int reason)
//  {
//   if(tenperiodMA!=INVALID_HANDLE)
//      IndicatorRelease(tenperiodMA);
////--- clear the chart after deleting the indicator
//   Comment("");
//
  //}    