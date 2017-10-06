//
//  ViewController.swift
//  ios-labels-matrix-view-swift
//
//  Created by neeks on 09/11/16.
//  Copyright © 2016 NewAgeLingo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var labelsMatrixView   : NALLabelsMatrixView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.labelsMatrixView = NALLabelsMatrixView(frame: CGRect.init(x: 5, y: 60, width: 310, height: 100), columns: [60, 125, 125])
        self.view.addSubview(self.labelsMatrixView)

        labelsMatrixView.addRecord(record: ["", "Old Value", "New Value"])
        labelsMatrixView.addRecord(record: ["1", "Item1", "Value1"])
        labelsMatrixView.addRecord(record: ["2", "Item2", "Value2"])
        labelsMatrixView.addRecord(record: ["Some Date", "06/24/2017", "06/30/2017"])
        labelsMatrixView.addRecord(record: ["Field1", "hello", "This is a really really long string and should wrap to multiple lines."])
        labelsMatrixView.addRecord(record: ["Long Fields", "The quick brown fox jumps over the little lazy dog.", "some new value"])
        
        return;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

