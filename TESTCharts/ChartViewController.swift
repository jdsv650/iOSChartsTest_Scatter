//
//  ChartViewController.swift
//  TESTCharts
//
//  Created by James on 1/22/19.
//  Copyright © 2019 com.jdsv650. All rights reserved.
//

import UIKit
import Charts
import Alamofire

class ChartViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var scatterChartView: ScatterChartView!
    
    var macAddress :String?  // passed in from previous ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scatterChartView.delegate = self
        
        mockData()
    }
    
    
    func mockData()
    {
        graphData()
    }
    

    
    func graphData()
    {
        // create and place chart descrioption
        scatterChartView.chartDescription?.text = "Scatter chart TEST"
        scatterChartView.chartDescription?.textAlign = .center
        scatterChartView.chartDescription?.textColor = UIColor.black
        scatterChartView.chartDescription?.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        let frame = self.view.frame
        let topLeft = CGPoint(x: (frame.minX+frame.maxX / 2), y: frame.minY)
        scatterChartView.chartDescription?.position = topLeft
        
        // misc chart settings
        scatterChartView.legend.enabled = false
        scatterChartView.backgroundColor = UIColor.white
        scatterChartView.borderColor = UIColor.black
        //ChartView.drawGridBackgroundEnabled = true
        
        var dataArray1 = [ChartDataEntry]()
        var dataArray2 = [ChartDataEntry]()
        
        //let p1 = ChartDataEntry(x: 1, y: 30)
        // let p2 = ChartDataEntry(x: 2, y: 87)
        // dataArray1.append(p1)
        // dataArray1.append(p2)
        
        var colors1 = [UIColor]() //1440
        var colors2 = [UIColor]() //1440
        
        for i in (0...1440-1)
        {
            let point = ChartDataEntry(x: Double(i), y: Double(arc4random() % 200) + 30)
            dataArray1.append(point)
            
            let randColorNum = arc4random() % 4
            print("randColorNum = \(randColorNum)")
            
            if randColorNum == 0
            {
                colors1.append(UIColor.yellow)
            }
            else if randColorNum == 1
            {
                colors1.append(UIColor.blue)
            }
            else if randColorNum == 2
            {
                colors1.append(UIColor.red)
            }
            else if randColorNum == 3
            {
                colors1.append(UIColor.green)
            }
        }
        
        // let p3 = ChartDataEntry(x: 1, y: 200)
        //  let p4 = ChartDataEntry(x: 2, y: 11)
        // dataArray2.append(p3)
        // dataArray2.append(p4)
        
        for i in (0...1440-1)
        {
            let point = ChartDataEntry(x: Double(i), y: Double(arc4random() % 200) + 30)
            dataArray2.append(point)
            
            let randColorNum = arc4random() % 4
            print("randColorNum = \(randColorNum)")
            
            if randColorNum == 0
            {
                colors2.append(UIColor.yellow)
            }
            else if randColorNum == 1
            {
                colors2.append(UIColor.blue)
            }
            else if randColorNum == 2
            {
                colors2.append(UIColor.red)
            }
            else if randColorNum == 3
            {
                colors2.append(UIColor.green)
            }
        }
        
        let dataSet1 = ScatterChartDataSet(values: dataArray1, label: "set1")
        
        dataSet1.setScatterShape(.circle)
        //dataSet1.setColors(UIColor.red)
        dataSet1.setColors(colors1, alpha: 1.0)
        dataSet1.scatterShapeSize = 5
        
        let dataSet2 = ScatterChartDataSet(values: dataArray2, label: "set2")
        
        dataSet2.setScatterShape(.square)
        dataSet2.setColors(colors2, alpha: 1.0)
        dataSet2.scatterShapeSize = 5
        //dataSet2.scatterShapeHoleRadius = 2
        //dataSet2.scatterShapeHoleColor = UIColor.black
        
        var dataSets = [ScatterChartDataSet]()
        dataSets.append(dataSet1)
        dataSets.append(dataSet2)
        
        let data = ScatterChartData(dataSets: dataSets)
        
        scatterChartView.xAxis.labelPosition = .bottom
        scatterChartView.rightAxis.enabled = true
        
        scatterChartView.data = data
        
        
        var xAxisLabels = [String]()
        
        for i in  0...dataArray1.count-1   {
            print("i = \(i)")
            xAxisLabels.append("\(i+1)")
        }
        
        // show labels on x axis from our data set
        let xAxis = scatterChartView.xAxis
        
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = UIColor.black
        xAxis.drawLabelsEnabled = true
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.granularity = 1
        xAxis.valueFormatter = AxisValueFormatter(values: xAxisLabels)
        
        // set min/max values for chart y-axis
        // for Daily Run Time set min-max to 0-100
        var yAxis = scatterChartView.getAxis(.left)
        yAxis.axisMaximum = 200
        yAxis.axisMinimum = 30
        
        yAxis = scatterChartView.getAxis(.right)
        yAxis.axisMaximum = 200
        yAxis.axisMinimum = 30
        
        
        scatterChartView.notifyDataSetChanged()
        
 
  }
    
    
    /***
    func graphData(sensor :Sensor)
    {
        let bars = populateBars(theSensor: sensor)
        
        var dataEntry = [BarChartDataEntry]()
        var xAxisLabels = [String]()
        
        // cycle through bars and grab label and value for each
        for (i, barChart) in  bars.enumerated()
        {
            print("i = \(i)")
            dataEntry.append(BarChartDataEntry(x: Double(i), y: barChart.value))
            xAxisLabels.append(barChart.label)
        }
        
        // load chart with data
        let dataSet = BarChartDataSet(values: dataEntry, label: "")
        
        dataSet.colors = [Constants.myMainColor]
        dataSet.valueColors = [UIColor.white]   // "hide" actual value displayed near top of bar by same color
        
        let data = BarChartData(dataSets: [dataSet])
        barChartView.data = data
        
        // create and place chart descrioption
        barChartView.chartDescription?.text = "Daily  Run Time Percent"
        barChartView.chartDescription?.textAlign = .center
        barChartView.chartDescription?.textColor = UIColor.black
        barChartView.chartDescription?.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        let frame = self.view.frame
        let topLeft = CGPoint(x: (frame.minX+frame.maxX / 2), y: frame.minY)
        barChartView.chartDescription?.position = topLeft
        
        // misc chart settings
        barChartView.drawValueAboveBarEnabled = false
        barChartView.legend.enabled = false
        barChartView.backgroundColor = UIColor.white
        barChartView.borderColor = UIColor.black
        //barChartView.legend.textColor = UIColor.orange
        //barChartView.drawGridBackgroundEnabled = true
        
        // show labels on x axis from our data set
        let xAxis = barChartView.xAxis
        
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = UIColor.black
        xAxis.drawLabelsEnabled = true
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.granularity = 1
        xAxis.valueFormatter = AxisValueFormatter(values: xAxisLabels)
        
        // set min/max values for chart y-axis
        // for Daily Run Time set min-max to 0-100
        var yAxis = barChartView.getAxis(.left)
        yAxis.axisMaximum = 100
        yAxis.axisMinimum = 0
        
        yAxis = barChartView.getAxis(.right)
        yAxis.axisMaximum = 100
        yAxis.axisMinimum = 0
        
        // refresh chart
        barChartView.notifyDataSetChanged()
    }
    
    // grab bar data to display in graph
    func populateBars(theSensor :Sensor) -> [Bar]
    {
        var barsRead = [Bar]()
        
        if theSensor.date1 != nil && theSensor.runT1 != nil  // must have both
        {
            let bar = Bar(label: theSensor.date1!, value: Double(theSensor.runT1!))
            barsRead.append(bar)
        }
        
        if theSensor.date2 != nil && theSensor.runT2 != nil  // must have both
        {
            let bar = Bar(label: theSensor.date2!, value: Double(theSensor.runT2!))
            barsRead.append(bar)
        }
        
        if theSensor.date3 != nil && theSensor.runT3 != nil  // must have both
        {
            let bar = Bar(label: theSensor.date3!, value: Double(theSensor.runT3!))
            barsRead.append(bar)
        }
        
        if theSensor.date4 != nil && theSensor.runT4 != nil  // must have both
        {
            let bar = Bar(label: theSensor.date4!, value: Double(theSensor.runT4!))
            barsRead.append(bar)
        }
        
        if theSensor.date5 != nil && theSensor.runT5 != nil  // must have both
        {
            let bar = Bar(label: theSensor.date5!, value: Double(theSensor.runT5!))
            barsRead.append(bar)
        }
        
        if theSensor.date6 != nil && theSensor.runT6 != nil  // must have both
        {
            let bar = Bar(label: theSensor.date6!, value: Double(theSensor.runT6!))
            barsRead.append(bar)
        }
        
        if theSensor.date7 != nil && theSensor.runT7 != nil  // must have both
        {
            let bar = Bar(label: theSensor.date7!, value: Double(theSensor.runT7!))
            barsRead.append(bar)
        }
        
        return barsRead
    }

    ***/
    
    
    
    func showInfoMessage(_ title: String, theMessage: String)
    {
        let alert = UIAlertController(title: title, message: theMessage, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        alert.view.tintColor = UIColor.green
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func refreshPressed(_ sender: UIBarButtonItem) {
        
    }
    
    
}


