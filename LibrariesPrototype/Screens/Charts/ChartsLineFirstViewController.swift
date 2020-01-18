//
//  ChartsLineFirstViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 18/01/2020.
//  Copyright © 2020 Ozgun Zor. All rights reserved.
//

import Charts
import UIKit

class ChartsLineFirstViewController: ChartsBaseViewController {
    var chartView: LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        chartView = LineChartView()

        updateChartData()
        updateUI()

        // Do any additional setup after loading the view.
        self.title = "Line Chart 1"

        chartView.delegate = self

        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true

        // x-axis limit line
        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
        llXAxis.lineWidth = 4
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .bottomRight
        llXAxis.valueFont = .systemFont(ofSize: 10)

        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0

        let ll1 = ChartLimitLine(limit: 150, label: "Upper Limit")
        ll1.lineWidth = 4
        ll1.lineDashLengths = [5, 5]
        ll1.labelPosition = .topRight
        ll1.valueFont = .systemFont(ofSize: 10)

        let ll2 = ChartLimitLine(limit: -30, label: "Lower Limit")
        ll2.lineWidth = 4
        ll2.lineDashLengths = [5, 5]
        ll2.labelPosition = .bottomRight
        ll2.valueFont = .systemFont(ofSize: 10)

        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.addLimitLine(ll1)
        leftAxis.addLimitLine(ll2)
        leftAxis.axisMaximum = 200
        leftAxis.axisMinimum = -50
        leftAxis.gridLineDashLengths = [5, 5]
        leftAxis.drawLimitLinesBehindDataEnabled = true

        chartView.rightAxis.enabled = false

        chartView.legend.form = .line

        chartView.animate(xAxisDuration: 2.5)
    }

    private func updateUI() {
        // Adding Constraints
        view.addSubview(chartView)
        chartView.addConstraints(equalToSuperview())
    }
}

extension ChartsLineFirstViewController: ChartViewDelegate {
    func updateChartData() {
        self.setDataCount(Int(20), range: UInt32(100))
    }

    func setDataCount(_ count: Int, range: UInt32) {
        let values = (0..<count).map { i -> ChartDataEntry in
            ChartDataEntry(x: Double(i), y: Double.random(in: 0.0...Double(range)))
        }

        let set1 = LineChartDataSet(entries: values, label: "DataSet 1")
        set1.drawIconsEnabled = false

        set1.lineDashLengths = [5, 2.5]
        set1.highlightLineDashLengths = [5, 2.5]
        set1.setColor(.black)
        set1.setCircleColor(.black)
        set1.lineWidth = 1
        set1.circleRadius = 3
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 9)
        set1.formLineDashLengths = [5, 2.5]
        set1.formLineWidth = 1
        set1.formSize = 15

        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!

        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
        set1.drawFilledEnabled = true

        let data = LineChartData(dataSet: set1)

        chartView.data = data
    }
}
