//
//  NALLabelsMatrix.swift
//  ios-labels-matrix-view-swift
//
//  Created by neeks on 09/11/16.
//  Copyright © 2016 NewAgeLingo. All rights reserved.
//

import Foundation
import UIKit


class NALLabelsMatrixView : UIView {
    var columnWidths: Array<Int>
    var numRows:Int=0
    var dy:Int=0
    
    public var headerColour:UIColor = .lightGray
    public var borderColour:UIColor = .gray
    
    init(frame:CGRect, columns:Array<Int>) {
        columnWidths = columns
        super.init(frame: frame);
        return;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addRecord(record:Array<String>){
        assert(columnWidths.count == record.count)
        
        let rowHeight:Int = 30
        var dx:Int = 0
        var maxHeight:Int = 30
        
        var rowColumns:[UILabel] = []
        
        //STYLE TO SET MARGINS AND ALIGNMENT
        let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.alignment = .natural
        paragraphStyle.headIndent = 10.0
        paragraphStyle.firstLineHeadIndent = 10.0
        paragraphStyle.tailIndent = -10.0
        
        //CREATE THE ITEMS/COLUMNS OF THE ROW
        for i in 0..<record.count {
            let colWidth:Int = self.columnWidths[i]
            let cellRect:CGRect = CGRect.init(x: dx, y: self.dy, width: colWidth, height: rowHeight)
            
            
            //ADJUST X FOR BORDER OVERLAPPING BETWEEN COLUMNS
            dx += colWidth - 1
            
            
            //CREATE THE LABEL TO BE USED AS CELL
            let column:UILabel = UILabel.init(frame: cellRect)
            column.layer.borderColor = self.borderColour.cgColor
            column.layer.borderWidth = 1.0
            column.font = UIFont.init(name: "Helvetica", size: 12.0)
            
            
            //SPECIAL TREATMENT FOR THE FIRST ROW
            if(self.numRows == 0){
                paragraphStyle.alignment = .center
                column.backgroundColor = self.headerColour
            }
            let attrText:NSAttributedString = NSAttributedString.init(string: record[i], attributes: [NSParagraphStyleAttributeName: paragraphStyle])
            column.attributedText = attrText
            column.lineBreakMode = .byWordWrapping
            column.numberOfLines = 0
            column.sizeToFit()
            
            
            //HEIGHT OF LONGEST LABEL
            if(column.frame.height > CGFloat(maxHeight)){
                maxHeight = Int(column.frame.height)+15
            }
            
            rowColumns.append(column)
            self.addSubview(column)
        }
        
        //MAKE ALL THE LABELS OF SAME HEIGHT AND MATCH COLUMN-WIDTH
        for i in 0..<rowColumns.count {
            var tempFrame:CGRect = rowColumns[i].frame
            tempFrame.size.width = CGFloat(self.columnWidths[i])
            tempFrame.size.height = CGFloat(maxHeight)
            rowColumns[i].frame = tempFrame
        }
        //
        
        //ADJUST Y FOR BORDER OVERLAPPING BETWEEN ROWS
        self.dy += maxHeight - 1
        
        self.numRows += 1
        
        return;
    }
}

