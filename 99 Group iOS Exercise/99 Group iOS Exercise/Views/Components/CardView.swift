//
//  CardView.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            //Card Image
            AsyncImage(url: URL(string: "https://picsum.photos/id/10/450/300")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 163)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                } else if phase.error != nil {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 163)
                        .foregroundColor(.secondary)
                } else {
                    ProgressView()                         .frame(height: 163)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            //Card Detail
            VStack(alignment: .leading,spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Parkview Apartments")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.primaryColor)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("12 Meyappa Chettiar Rd · D13")
                        Text("Exec Condo · 2020 · 99 yrs")
                    }
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.secondaryColor)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("3 Beds  ·  2 Baths  ·  2,561 sqft")
                        .font(.system(size: 12, weight: .medium))
                    Text("$5,700/mo")
                        .font(.system(size: 16, weight: .bold))
                }
                .foregroundStyle(Color.primaryColor)
            }
            .frame(maxWidth:.infinity, alignment: .leading)
        }
        .padding(12)
        .frame(width: 367, height: 320)
        .background(RoundedRectangle(cornerRadius: 4)
                        .fill(Color(.systemBackground)))
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .shadow(color: .shadowColor.opacity(0.15), radius: 5, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
        )
    }
}

#Preview {
    CardView()
}
