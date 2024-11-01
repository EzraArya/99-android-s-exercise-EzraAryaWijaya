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
            
            VStack(alignment: .leading,spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Title")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("StreetName · District")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(.secondary)
                        Text("Category · Created_at · Tenure")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(.secondary)
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("Bed · Bath · area_size")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.primary)
                    Text("Price /Mo")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.primary)
                }
            }
            .frame(maxWidth:.infinity, alignment: .leading)
        }
        .padding(12)
        .frame(width: 367, height: 320)
        .background(RoundedRectangle(cornerRadius: 4)
                        .fill(Color(.systemBackground)))
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
        )
        .padding(12)
    }
}

#Preview {
    CardView()
}
