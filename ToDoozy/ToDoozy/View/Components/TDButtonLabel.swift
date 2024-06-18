//
//  TDButtonLabel.swift
//  ToDoozy
//
//  Created by christian on 6/18/24.
//

import SwiftUI

struct TDButtonLabel: View {
    let symbolName: String
    let label: String
    var iconColor: Color = .blue
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: symbolName)
                .foregroundStyle(iconColor)
            Text(label)
                .foregroundStyle(.primary)
        }
        .font(.headline)
        .fontWeight(.medium)
        .frame(minWidth: 100)
    }
}

#Preview {
    TDButtonLabel(symbolName: "plus.circle", label: "New List")
}
