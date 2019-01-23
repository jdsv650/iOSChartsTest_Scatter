//
//  YAxisValueFormatter.swift
//  TESTCharts
//
//  Created by James on 1/22/19.
//  Copyright © 2019 com.jdsv650. All rights reserved.
//

import Foundation
import Charts

class YAxisValueFormatter: IAxisValueFormatter {
    
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        // "value" represents the position of the label on the axis (x or y)
         return "\(value) ℉"
    }
    
    
    init(values :[String]) {
    }
    
}

