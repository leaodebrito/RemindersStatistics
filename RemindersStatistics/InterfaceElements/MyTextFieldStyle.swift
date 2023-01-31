//
//  MyTextField.swift
//  RemindersStatistics
//
//  Created by Bruno Brito on 31/01/23.
//

import SwiftUI


struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}


struct MyTextFieldStyle2: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
