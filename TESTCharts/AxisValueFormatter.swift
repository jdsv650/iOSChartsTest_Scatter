//
//  AxisValueFormatter.swift
//  ChartsTEST
//
//  Created by James on 1/22/19.
//  Copyright © 2019 com.jdsv650. All rights reserved.
//

import Foundation
import Charts

class AxisValueFormatter: IAxisValueFormatter {
    
    var mValues = [String]()
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        // "value" represents the position of the label on the axis (x or y)
        
        let posAsInt = Int(value)
      
       // return "\(mValues[posAsInt]) ?"
        if posAsInt == 0 || posAsInt == -720 || posAsInt == -1440 || posAsInt == -2160 || posAsInt == -2880
        {
             return "\(posAsInt)"
        }
       
        return ""
    }
    
  
    init(values :[String])
    {
        
    }

}

