//
//  SearchView.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.properties) { property in
                    CardView(property: property)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        .padding(.horizontal, 12)
                        .background(
                            NavigationLink("", destination: DetailView(id: property.id))
                                .opacity(0)
                        )
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Search Results")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
             await viewModel.fetchProperties()
        }
    }
}

#Preview {
    ContentView()
}
