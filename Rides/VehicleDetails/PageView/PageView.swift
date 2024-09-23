//
//  PageView.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-22.
//


import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 20))
        }
    }
}

#Preview {
    PageView(pages: [CarbonEmissionsView(carbonEmissions: 1500, kilometrage: 4500) ])
}
