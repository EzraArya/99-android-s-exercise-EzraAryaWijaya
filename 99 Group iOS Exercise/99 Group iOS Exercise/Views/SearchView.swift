//
//  SearchView.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//

import SwiftUI

struct SearchView: View {
    var ListTing = ["Yes", "No", "Maybe"]
    var body: some View {
        VStack {
            List (ListTing, id: \.self) { item in
                Text(item)
            }
        }
        .navigationTitle("Search Result")
    }
}

#Preview {
    SearchView()
}
