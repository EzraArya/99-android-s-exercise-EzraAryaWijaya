//
//  SearchView.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            List {
                ForEach(0..<10, id: \.self) { index in
                    CardView()
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        .padding(.horizontal, 12)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Search Results")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
