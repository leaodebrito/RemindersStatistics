//
//  TodayError.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 28/01/23.
//

import Foundation

enum TodayError: LocalizedError{
    case failedReadingReminders
    case reminderHasNoDueDate
    
    
    var errorDescription: String?{
        switch self {
        case .failedReadingReminders:
            return NSLocalizedString("Falha ao ler lembretes.", comment: "Falha ao ler lembretes - Descrição do erro")
        case .reminderHasNoDueDate:
            return NSLocalizedString("Lembrete não tem data limite", comment: "Lembrete não tem data limite - Descrição do erro")
        }
    }
}
