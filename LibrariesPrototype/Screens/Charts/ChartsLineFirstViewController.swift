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

        updateUI()

        // Do any additional setup after loading the view.
        self.title = "Line Chart 1"
        //        self.options = [.toggleValues,
        //                        .toggleFilled,
        //                        .toggleCircles,
        //                        .toggleCubic,
        //                        .toggleHorizontalCubic,
        //                        .toggleIcons,
        //                        .toggleStepped,
        //                        .toggleHighlight,
        //                        .animateX,
        //                        .animateY,
        //                        .animateXY,
        //                        .saveToGallery,
        //                        .togglePinchZoom,
        //                        .toggleAutoScaleMinMax,
        //                        .toggleData]

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

        //[_chartView.viewPortHandler setMaximumScaleY: 2.f];
        //[_chartView.viewPortHandler setMaximumScaleX: 2.f];

        //            let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
        //                                       font: .systemFont(ofSize: 12),
        //                                       textColor: .white,
        //                                       insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        //            marker.chartView = chartView
        //            marker.minimumSize = CGSize(width: 80, height: 40)
        //            chartView.marker = marker

        chartView.legend.form = .line

        chartView.animate(xAxisDuration: 2.5)
    }

    private func updateUI() {
        // Adding Constraints
        view.addSubview(chartView)
        chartView.addConstraints(equalToSuperview())

//        chartView.addConstraints([equal(view, \.topAnchor),
//                                      equal(view, \.trailingAnchor),
//                                      equal(view, \.leadingAnchor),
//                                      equal(\.heightAnchor, to: 200)])
    }
}

extension ChartsLineFirstViewController: ChartViewDelegate {

}
