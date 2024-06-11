//+------------------------------------------------------------------+
//|                                                          ICT.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                    [https://www.mql5.com](https://www.mql5.com/) |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "[https://www.mql5.com](https://www.mql5.com/)"
#property version   "1.00"

//input string startTradingTime = "09:00";
//input string endTradingTime = "16:30";
//input int dailyOpens = 0;
//input int weeklyOpens = 0;
//input bool ictlondonclosekillzone = false;
//input bool drawSessionBoxes = true;


//string prices = "";

//MqlRates  weeklyPriceArray[], dailyPriceArray[], hourlyPriceArray[], minutePriceArray[];
//
//double newyorkHighPrices[], newyorkLowPrices[];
//
//
//
//double londonHighPrices[], londonLowPrices[];
//
//datetime newyorkOpenTime, asianOpenTime, londonOpenTime, judasOpenTime;
//datetime newyorkCloseTime, asianCloseTime, londonCloseTime;
//datetime ictLondonCloseOpenTime, ictLondonCloseTime;
//double ictLondonClosePrice;
//int newyorkHighPrice, londonHighPrice;
//int newyorkLowPrice, londonLowPrice;
//
//double weeklyOpenPrice, dailyOpenPrice;
//
//double asianHigh, asianLow, londonHigh, londonLow, newyorkHigh, newyorkLow;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void OnTick() {
//
//
//     //int londonData = CopyRates(_Symbol,PERIOD_M1, londonOpen, londonClose, londonPriceArray);
//
//     
//     
//
//     
//
//     
//
//
////+------------------------------------------------------------------+
////|  Session Values                                                  |
////+------------------------------------------------------------------+
//     
//     //ArraySetAsSeries(minutePriceArray, true);
//     //ArraySetAsSeries(hourlyPriceArray, true);
//     
//     //ArraySetAsSeries(weeklyPriceArray, true);
//     //CopyRates(_Symbol, PERIOD_M1, 0, 40320, minutePriceArray);
//     //CopyRates(_Symbol, PERIOD_H1, 0, 672, hourlyPriceArray);
//     
//     //CopyRates(_Symbol, PERIOD_W1, 0, 4, weeklyPriceArray);
//     

//
//     
//     

//     //ArraySetAsSeries(londonPriceArray, true);
//     //ArraySetAsSeries(newyorkPriceArray, true);
//     
//     //CopyRates(_Symbol, PERIOD_M1, 0, 720, londonPriceArray);
//     //CopyRates(_Symbol, PERIOD_M1, 0, 720, newyorkPriceArray);
//     
//     

//     //ArraySetAsSeries(londonHighPrices, true);
//     //ArraySetAsSeries(londonLowPrices, true);
//     //ArraySetAsSeries(newyorkHighPrices, true);
//     //ArraySetAsSeries(newyorkLowPrices, true);
//     

//     //CopyHigh(_Symbol, PERIOD_M1, londonOpenTime, londonCloseTime, londonHighPrices);
//     //CopyLow(_Symbol, PERIOD_M1, londonOpenTime, londonCloseTime, londonLowPrices);
//     //CopyHigh(_Symbol, PERIOD_M1, newyorkOpenTime, newyorkCloseTime, newyorkHighPrices);
//     //CopyLow(_Symbol, PERIOD_M1, newyorkOpenTime, newyorkCloseTime, newyorkLowPrices);
//    
//    

//     //londonHighPrice = ArrayMaximum(londonHighPrices, 0);
//     //londonLowPrice = ArrayMinimum(londonLowPrices, 0);
//     //newyorkHighPrice = ArrayMaximum(newyorkHighPrices, 0);
//     //newyorkLowPrice = ArrayMinimum(newyorkLowPrices, 0);
//     
 
    
//     
////     if (minutePriceArray[0].time > londonOpenTime) {
////          londonHigh = londonPriceArray[londonHighPrice].high;
////          londonLow = minutePriceArray[londonLowPrice].high;
////     }
////     
////     if (minutePriceArray[0].time > newyorkOpenTime) {
////          newyorkHigh = minutePriceArray[newyorkHighPrice].high;
////          newyorkLow = minutePriceArray[newyorkLowPrice].high;
////     }
//     
//     
//     
//     ObjectSetInteger(_Symbol, "dailyOpen_0",OBJPROP_COLOR, clrViolet);
//     ObjectCreate(_Symbol, "asianHigh", OBJ_HLINE, 0, 0, asianHigh);
//    
//    
////    if (asianData > 0) {
////     
////    
////    }
//    
//
//
//
////     datetime ictNewYorkOpenTime = newyorkOpenTime;
////     datetime ictNewYorkCloseTime = ictNewYorkOpenTime + 7200;
////
////     ictLondonCloseOpenTime = londonOpenTime + 25200;
////     ictLondonCloseTime = ictLondonCloseOpenTime + 7200;
////
////     double ictNewYorkOpenPrice;
//
//
//
////     for(int i = 0; i < hourlyPriceArray.Size(); i++) { 
////          if(hourlyPriceArray[i].time == ictNewYorkOpenTime) {
////               ictNewYorkOpenPrice = hourlyPriceArray[i].high;
////          }
////     }
////     
////     for(int i = 0; i < hourlyPriceArray.Size(); i++) { 
////          if(hourlyPriceArray[i].time == ictLondonCloseOpenTime) {
////               ictLondonClosePrice = hourlyPriceArray[i].high;
////          }
////     }
////
////     weeklyOpenPrice = weeklyPriceArray[0].open;
//     
//     //MARK: - Judas Swing Values
//
//     //judasOpenTime = asianOpenTime + 14400;
//     //ObjectCreate(_Symbol,"judasOpenLine", OBJ_VLINE, 0, judasOpenTime, 0.0);
//     //ObjectSetInteger(_Symbol, "judasOpenLine", OBJPROP_COLOR, clrAzure);
//
//     //for(int i=0; i <= weeklyOpens; i++) {
//     //     ObjectCreate(_Symbol, "weeklyOpen_" + i, OBJ_TREND, 0, weeklyPriceArray[i].time + 86400, weeklyPriceArray[i].open, weeklyPriceArray[i].time + 432000, weeklyPriceArray[i].open);
//
//     //}
//
//
//     //ObjectSetInteger(_Symbol, "weeklyOpen_0",OBJPROP_COLOR, clrPurple);
//     //ObjectCreate(_Symbol, "weeklyOpenLine", OBJ_VLINE, 0, weeklyPriceArray[0].time + 86400, 0);
//     //ObjectCreate(_Symbol, "weeklyCloseLine", OBJ_VLINE,0, weeklyPriceArray[0].time + 432000, 0);
//
////MARK: - Daily Values
//
//     
//     //ObjectCreate(_Symbol, "londonOpen", OBJ_VLINE, 0, londonOpenTime, 0);
//     //ObjectCreate(_Symbol, "newyorkOpen", OBJ_VLINE, 0, newyorkOpenTime, 0);
//
//
//
////Comment(ObjectGetDouble(_Symbol, "yesterdayLow", OBJPROP_PRICE, 0));
//   //dailyOpenPrice = dailyPriceArray[0].open;
//   //ObjectCreate(_Symbol, "dailyOpen", OBJ_TREND, 0, dailyPriceArray[0].time, dailyOpenPrice, dailyPriceArray[0].time + 86400, dailyOpenPrice);
//   //ObjectSetInteger(_Symbol, "dailyOpen",OBJPROP_COLOR, clrPurple);
////
////   ObjectCreate(_Symbol, "yesterdayOpen", OBJ_TREND, 0, dailyPriceArray[1].time, dailyPriceArray[1].open, dailyPriceArray[1].time + 86400, dailyPriceArray[1].open);
////ObjectCreate(_Symbol, "ictNewYorkOpenTime", OBJ_VLINE, 0, ictNewYorkOpenTime, 0);
////ObjectCreate(_Symbol, "ictNewYorkCloseTime", OBJ_VLINE, 0, ictNewYorkCloseTime, 0);
//
//     //ObjectCreate(_Symbol, "ictNewyorkOpenText", OBJ_TEXT, 0, (ictNewYorkOpenTime + ictNewYorkCloseTime)/2, ictNewYorkOpenPrice + 0.0015, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015);
//     //ObjectSetString(_Symbol, "ictNewyorkOpenText", OBJPROP_TEXT, "New York Open");
//     //ObjectSetInteger(_Symbol, "ictNewyorkOpenText",OBJPROP_COLOR, clrDodgerBlue);
//     //ObjectSetInteger(_Symbol, "ictNewyorkOpenText",OBJPROP_FONTSIZE, 10);
//     //ObjectSetInteger(_Symbol, "ictNewyorkOpenText", OBJPROP_ANCHOR, ANCHOR_CENTER);
//
//     //ObjectCreate(_Symbol, "ictNewyorkOpenBox", OBJ_RECTANGLE, 0, ictNewYorkOpenTime, ictNewYorkOpenPrice + 0.0015 + 0.0002, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015 - 0.0002);
//     //ObjectCreate(_Symbol, "ictNewyorkOpenBoxLeft", OBJ_TREND, 0, ictNewYorkOpenTime, ictNewYorkOpenPrice + 0.0015 + 0.0001, ictNewYorkOpenTime, ictNewYorkOpenPrice + 0.0015 - 0.0005);
//     //ObjectCreate(_Symbol, "ictNewyorkOpenBoxRight", OBJ_TREND, 0, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015 + 0.0001, ictNewYorkCloseTime, ictNewYorkOpenPrice + 0.0015 - 0.0005);
//     
//     
//     
//     
//     //Comment(asianHigh, "\n", asianLow);
//    
//
//
//     //Switch Case 
//     //On the chart set up clickable butttons to control the switch
//     //Use boolean to set up different modes
     
//     if (ictlondonclosekillzone) {
//          Comment("True");
//          ObjectCreate(_Symbol, "ictLondonCloseOpenTimeText", OBJ_TEXT, 0, (ictLondonCloseOpenTime + ictLondonCloseTime)/2, ictLondonClosePrice + 0.0015, ictLondonCloseTime, ictLondonClosePrice + 0.0015);
//          ObjectSetString(_Symbol, "ictLondonCloseOpenTimeText", OBJPROP_TEXT, "London Open");
//          ObjectSetInteger(_Symbol, "ictLondonCloseOpenTimeText",OBJPROP_COLOR, clrDodgerBlue);
//          ObjectSetInteger(_Symbol, "ictLondonCloseOpenTimeText",OBJPROP_FONTSIZE, 10);
//          ObjectSetInteger(_Symbol, "ictLondonCloseOpenTimeText", OBJPROP_ANCHOR, ANCHOR_CENTER);
//     
//          ObjectCreate(_Symbol, "ictLondonCloseOpenBox", OBJ_RECTANGLE, 0, ictLondonCloseOpenTime, ictLondonClosePrice + 0.0015 + 0.0002, ictLondonCloseTime, ictLondonClosePrice + 0.0015 - 0.0002);
//          ObjectCreate(_Symbol, "ictLondonCloseOpenBoxLeft", OBJ_TREND, 0, ictLondonCloseOpenTime, ictLondonClosePrice + 0.0015 + 0.0001, ictLondonCloseOpenTime, ictLondonClosePrice + 0.0015 - 0.0005);
//          ObjectCreate(_Symbol, "ictLondonCloseOpenBoxRight", OBJ_TREND, 0, ictLondonCloseTime, ictLondonClosePrice + 0.0015 + 0.0001, ictLondonCloseTime, ictLondonClosePrice + 0.0015 - 0.0005);
//     
//     }
//     
//     if (drawSessionBoxes) {
//          DrawSsesionBoxes();
//     }
//     
//
//}



//void DrawSsesionBoxes() {


     
     
     //ObjectCreate(_Symbol, "asianBox", OBJ_RECTANGLE, 0, asianOpenTime, asianLow, asianCloseTime, asianHigh);
     //ObjectSetInteger(_Symbol, "asianBox",OBJPROP_COLOR, clrPurple);
     //ObjectSetInteger(_Symbol, "asianBox",OBJPROP_FILL, true);

//     ObjectCreate(_Symbol, "newyorkBox", OBJ_RECTANGLE, 0, newyorkOpen, newyorkPriceArray[newyorkLowPrice].low, newyorkClose, newyorkPriceArray[newyorkHighPrice].high);
//     ObjectSetInteger(_Symbol, "newyorkBox",OBJPROP_COLOR, clrSpringGreen);
//     ObjectSetInteger(_Symbol, "newyorkBox",OBJPROP_FILL, true);
//
//     ObjectCreate(_Symbol, "londonBox", OBJ_RECTANGLE, 0, londonOpen, londonPriceArray[londonLowPrice].low, londonClose, londonPriceArray[londonHighPrice].high);
//     ObjectSetInteger(_Symbol, "londonBox",OBJPROP_COLOR, clrBlue);
//     ObjectSetInteger(_Symbol, "londonBox",OBJPROP_FILL, true);


//}

//+------------------------------------------------------------------+
     //ObjectCreate(_Symbol, "yesterdayLow", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].low, dailyPriceArray[0].time + 86400, dailyPriceArray[1].low);
     //ObjectCreate(_Symbol, "yesterdayHigh", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].high, dailyPriceArray[0].time + 86400, dailyPriceArray[1].high);
     //ObjectCreate(_Symbol, "yesterdayClose", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].close, dailyPriceArray[0].time + 86400, dailyPriceArray[1].close);
     //ObjectCreate(_Symbol, "yesterdayOpen", OBJ_TREND, 0, dailyPriceArray[0].time, dailyPriceArray[1].open, dailyPriceArray[0].time + 86400, dailyPriceArray[1].open);
     //ObjectSetInteger(_Symbol, "yesterdayLow",OBJPROP_COLOR, clrDodgerBlue);
     //ObjectSetInteger(_Symbol, "yesterdayHigh",OBJPROP_COLOR, clrDodgerBlue);
     //ObjectSetInteger(_Symbol, "yesterdayClose",OBJPROP_COLOR, clrWhite);
     //ObjectSetInteger(_Symbol, "yesterdayOpen",OBJPROP_COLOR, clrGray);


MqlRates dailyPriceArray[], asianPriceArray[], newyorkPriceArray[], londonPriceArray[]; 
datetime asianOpenTime, asianCloseTime, newyorkOpenTime, newyorkCloseTime, londonOpenTime, londonCloseTime;
void OnTick() {


     /// MARK: - Daily Session Values
     ArraySetAsSeries(dailyPriceArray, true);
     int dailyData = CopyRates(_Symbol, PERIOD_D1, 0, 28, dailyPriceArray);
     double dailyOpenPrice = dailyPriceArray[0].open;
     datetime dailyOpenTime = dailyPriceArray[0].time;
     ObjectCreate(_Symbol, "dailyOpen", OBJ_VLINE, 0, dailyOpenTime, 0);

     asianOpenTime = dailyPriceArray[1].time + 10800;
     asianCloseTime = asianOpenTime + 32400;
     londonOpenTime = dailyPriceArray[0].time + 36000;
     londonCloseTime = londonOpenTime + 32400;
     newyorkOpenTime = dailyPriceArray[0].time + 54000;
     newyorkCloseTime = newyorkOpenTime + 32400;
          
     if (TimeCurrent() > newyorkOpenTime) {
          drawAsianSession();
          drawLondonSession();
          drawNewYorkSession();
     }
     else if (TimeCurrent() > londonOpenTime) {
          drawAsianSession();
          drawLondonSession();
          newyorkOpenTime -= 86400;
          newyorkCloseTime -= 86400;
          drawNewYorkSession();
     }
     else if (TimeCurrent() > asianOpenTime) {
          drawAsianSession();
          londonCloseTime -= 86400;
          londonOpenTime -= 86400;
          drawLondonSession();
          newyorkOpenTime -= 86400;
          newyorkCloseTime -= 86400;
          drawNewYorkSession();
     }
     else {
          asianOpenTime -= 86400;
          asianCloseTime -= 86400;
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
     /// MARK - Asian Session Values
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
     
     double asianHigh = asianPriceArray[asianHighPrice].high;
     double asianLow = asianPriceArray[asianLowPrice].low;
     
     ObjectCreate(_Symbol, "asianBox", OBJ_RECTANGLE, 0, asianOpenTime, asianPriceArray[asianLowPrice].low, asianCloseTime, asianPriceArray[asianHighPrice].high);
     ObjectSetInteger(_Symbol, "asianBox",OBJPROP_BACK, true);
     ObjectSetInteger(_Symbol, "asianBox",OBJPROP_COLOR, clrPurple);
     ObjectSetInteger(_Symbol, "asianBox",OBJPROP_FILL, true);
}

void drawLondonSession() {
     /// MARK - London Session Values
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
     
     double londonHigh = londonPriceArray[londonHighPrice].high;
     double londonLow = londonPriceArray[londonLowPrice].low;
     
     ObjectCreate(_Symbol, "londonBox", OBJ_RECTANGLE, 0, londonOpenTime, londonPriceArray[londonLowPrice].low, londonCloseTime, londonPriceArray[londonHighPrice].high);
     ObjectSetInteger(_Symbol, "londonBox",OBJPROP_BACK, true);   
     ObjectSetInteger(_Symbol, "londonBox",OBJPROP_COLOR, clrBlue);
     ObjectSetInteger(_Symbol, "londonBox",OBJPROP_FILL, true);
}

void drawNewYorkSession() {
      //--- New York Session Values
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
     
     double newyorkHigh = newyorkPriceArray[newyorkHighPrice].high;
     double newyorkLow = newyorkPriceArray[newyorkLowPrice].low;
     
     ObjectCreate(_Symbol, "newyorkBox", OBJ_RECTANGLE, 0, newyorkOpenTime, newyorkPriceArray[newyorkLowPrice].low, newyorkCloseTime, newyorkPriceArray[newyorkHighPrice].high);
     ObjectSetInteger(_Symbol, "newyorkBox",OBJPROP_BACK, true);
     ObjectSetInteger(_Symbol, "newyorkBox",OBJPROP_COLOR, clrSpringGreen);
     ObjectSetInteger(_Symbol, "newyorkBox",OBJPROP_FILL, true);
}