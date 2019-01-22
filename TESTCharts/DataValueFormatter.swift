//
//  DataValueFormatter.swift
//  ChartsTEST
//
//  Created by James on 1/22/19.
//  Copyright © 2019 com.jdsv650. All rights reserved.
//

import Foundation
import Charts

class DataValueFormatter :IValueFormatter
{
    public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String
    {
        return String(format: "%.0f", locale: Locale.current, value)
    }
    
}
