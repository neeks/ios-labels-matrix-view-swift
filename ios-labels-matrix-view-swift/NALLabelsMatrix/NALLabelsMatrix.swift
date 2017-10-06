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
            
            
            //SET LEFT RIGHT MARGINS & ALIGNMENT FOR THE LABEL
            let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle.init()
            paragraphStyle.alignment = .natural
            paragraphStyle.headIndent = 10.0
            paragraphStyle.firstLineHeadIndent = 10.0
            paragraphStyle.tailIndent = -10.0
            
            //SPECIAL TREATMENT FOR THE FIRST ROW
            if(self.numRows == 0){
                paragraphStyle.alignment = .center
                column.backgroundColor = self.headerColour
            }
            let attrText:NSAttributedString = NSAttributedString.init(string: record[i], attributes: [NSParagraphStyleAttributeName: paragraphStyle])
            
            
            //USED TO FIND HEIGHT OF LONGEST LABEL
            //
            //MAKE THE LABEL WIDTH SAME AS COLUMN'S WIDTH
            //
            //USED FOR SETTING THE NEXT COLUMN X POSITION
            //
            
            column.attributedText = attrText
            self.addSubview(column)
        }
        
        //MAKE ALL THE LABELS OF SAME HEIGHT AND THEN ADD TO VIEW
        //
        
        //ADJUST Y FOR BORDER OVERLAPPING BETWEEN ROWS
        self.dy += rowHeight - 1
        
        self.numRows += 1
        
        return;
    }
}

