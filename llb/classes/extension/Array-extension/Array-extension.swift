//  Created by adong666666 on 2018/9/4. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

extension Array
{
    mutating func swap(i:Int,j:Int)
    {
        let temp = self[i]
        self[i] = self[j]
        self[j] = temp
    }
}
extension Array where Element:Comparable
{
    mutating func selectorSort() {
        
        var min = 0
        for i in 0..<self.count-1
        {
            min = i
            
            for j in i+1...self.count-1
            {
                if self[j] < self[min]
                {
                    min = j
                }
            }
            
            if min != i
            {
                swap(i: min, j: i)
            }
        }
    }
}
