//
//  ViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/12.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import RealmSwift
import Charts

class ViewController: UIViewController {
var days = [String]()
    var lineChart:LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view!.backgroundColor = UIColor.white
        
        let items = ["支出", "收入"] as [Any]

        let segmented = UISegmentedControl(items:items)
        segmented.frame = CGRect(x:20, y:66, width:kScreenWidth-40, height:40)
        
        segmented.selectedSegmentIndex = 0
        segmented.addTarget(self, action: #selector(ADDAccountViewController.segmentDidchange(_:)),
                            for: .valueChanged)
        self.view.addSubview(segmented)

        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月"
        
      let  monthLabel = UILabel(frame:CGRect(x:10, y:120, width:kScreenWidth-20, height:40))
        monthLabel.textColor = UIColor.black
        monthLabel.text = formatter.string(from: Date())
        self.view.addSubview(monthLabel)
        
        
        
        lineChart = LineChartView()
        lineChart.frame = CGRect(x:10, y:200, width:kScreenWidth-20, height:500)
        
        self.view.addSubview(lineChart)
        
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        
        setChart(months, values: unitsSold)
     
        
        
 
    }
    //设置charts方法
    func setChart(_ dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "单位：元")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        
        lineChart.data = lineChartData
        //右下角图标描述
        lineChart.chartDescription?.text = "ChartView"
        
        //左下角图例
        //        lineChart.legend.formSize = 30
        //        lineChart.legend.form = .square
        lineChart.legend.textColor = UIColor.black
        
        //设置X轴坐标
        lineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        lineChart.xAxis.granularity = 1.0
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.xAxis.axisLineColor = UIColor.red
        lineChart.xAxis.labelTextColor = UIColor.black
        
        //设置Y轴坐标
        //        lineChart.rightAxis.isEnabled = false
        //不显示右侧Y轴
        lineChart.rightAxis.drawAxisLineEnabled = false
        //不显示右侧Y轴数字
        lineChart.rightAxis.enabled = false
        lineChart.leftAxis.axisLineColor = UIColor.orange
        lineChart.leftAxis.gridColor = UIColor.gray
        lineChart.leftAxis.labelTextColor = UIColor.gray
        
        //设置双击坐标轴是否能缩放
        lineChart.scaleXEnabled = false
        lineChart.scaleYEnabled = false
        
        //        lineChart.dragEnabled = true
        //        lineChart.dragDecelerationEnabled = true
        
        //设置图表背景色和border
        //必须设置enable才能有效
        //        lineChart.drawGridBackgroundEnabled = true
        //        lineChart.drawBordersEnabled = true
        //        lineChart.gridBackgroundColor = UIColor.red
        //        lineChart.borderColor = UIColor.orange
        //        lineChart.borderLineWidth = 5
        
        //设置折线线条
        //        lineChartDataSet.fillColor = kDefault_0xff6600_clolr
        //        lineChartDataSet.lineWidth = 4
        
        //外圆
        lineChartDataSet.setCircleColor(UIColor.red)
        //画外圆
               lineChartDataSet.drawCirclesEnabled = true
        //内圆
        lineChartDataSet.circleHoleColor = UIColor.orange
        //画内圆
        lineChartDataSet.drawCircleHoleEnabled = true
        
        //线条显示样式
                lineChartDataSet.lineDashLengths = [1,3,4,2]
                lineChartDataSet.lineDashPhase = 0.5
        lineChartDataSet.colors = [UIColor.green]
        
        //线条上的文字
        lineChartDataSet.valueColors = [UIColor.red]
        //显示
        //        lineChartDataSet.drawValuesEnabled = true
        
        //添加显示动画
        lineChart.animate(xAxisDuration: 1)
    }
    
    
    
    @objc  func segmentDidchange(_ segmented:UISegmentedControl){
    
        print(segmented.titleForSegment(at: segmented.selectedSegmentIndex))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

