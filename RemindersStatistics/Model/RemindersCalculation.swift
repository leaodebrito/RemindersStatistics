//
//  RemindersCalculation.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 01/02/23.
//

import Foundation
import SwiftUI
import CoreData


struct RemindersCalculation {
    
    var lembrete = [FetchedResults<Reminder>]().self

    
    func remindersAmount() -> Int{
        var count = 0
        for _ in lembrete{
            count = count + 1
        }
        return count
    }
    
    
    
}

let remindersCalculations = RemindersCalculation()
