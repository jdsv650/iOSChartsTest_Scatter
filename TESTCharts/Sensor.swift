//
//  Sensor.swift
//  TESTCharts
//
//  Created by James on 1/22/19.
//  Copyright © 2019 com.jdsv650. All rights reserved.
//

import Foundation

class Sensor : NSObject, NSCoding
{
    // login page
    var id : Int?
    var dateTime :String?
    var macAddress :String?
    var location :String?   // mfg line
    
    // current status scr
    var switchSetting :Int?
    var operatingState :Int?
    var boxT :Float?
    var dBm :Float?
    
    // monitoring summary
    var totalRunTime :Int?
    var runTime :Int?
    var runPercentage :Float?
    var avgCycleTime :Float?
    
    // daily run time percentage scr
    var date1 :String?
    var date2 :String?
    var date3 :String?
    var date4 :String?
    var date5 :String?
    var date6 :String?
    var date7 :String?
    var runT1 :Float?
    var runT2 :Float?
    var runT3 :Float?
    var runT4 :Float?
    var runT5 :Float?
    var runT6 :Float?
    var runT7 :Float?
    
    // on/off cycle
    var on1 :Float?
    var on2 :Float?
    var on3: Float?
    var on4 :Float?
    var on5 :Float?
    var on6: Float?
    var on7: Float?
    
    //avg cycle run time
    var cycle1 :Float?
    var cycle2 :Float?
    var cycle3 :Float?
    var cycle4 :Float?
    var cycle5 :Float?
    var cycle6 :Float?
    var cycle7 :Float?
    
    override init() {
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(macAddress, forKey: "macAddress")
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        if let theMacAddress = aDecoder.decodeObject(forKey: "macAddress") as? String
        {
            macAddress = theMacAddress
        }
    }
    
    
}

