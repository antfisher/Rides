//
//  SortingView.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-22.
//

import SwiftUI

struct SortingView: View {
    
    @Binding var sorting: Sorting
    
    var body: some View {
        HStack {
            Picker("Sort by", selection: $sorting.parameter) {
                ForEach(SortingParameter.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            Picker("Order", selection: $sorting.order) {
                ForEach(SortingOrder.allCases, id: \.self) {
                    $0.image
                }
            }
            .pickerStyle(.segmented)
            .frame(maxWidth: 80)
        }
        .padding([.horizontal, .top])
    }
}

private extension SortingOrder {
    var image: Image {
        switch self {
        case .ascending:
            return Image(systemName: "arrow.up")
        case .descending:
            return Image(systemName: "arrow.down")
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    SortingView(sorting: Binding(projectedValue: .constant(Sorting(order: .ascending, parameter: .vin))))
}

#Preview {
    SortingView(sorting: Binding(projectedValue: .constant(Sorting(order: .ascending, parameter: .vin))))
}
