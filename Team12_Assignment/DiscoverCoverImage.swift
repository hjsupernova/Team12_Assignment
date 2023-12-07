//
//  DiscoverCoverImage.swift
//  Team12_Assignment
//
//  Created by KHJ on 2023/11/26.
//

import SwiftUI

struct DiscoverCoverImage: View {
    var body: some View {
        Image(systemName: "heart")
            .resizable()
            .renderingMode(.original)
            .discoverPosterStyle()
    }
}

struct DiscoverPosterStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(0.66, contentMode: .fit)
            .frame(maxWidth: 245)
            .cornerRadius(5)
    }
}

extension View {
    func discoverPosterStyle() -> some View {
        modifier(DiscoverPosterStyle())
    }
}



#Preview {
    DiscoverCoverImage()
}
