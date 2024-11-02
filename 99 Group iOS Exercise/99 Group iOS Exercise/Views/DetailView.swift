//
//  DetailView.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//
import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel: DetailViewModel
    var id: Int

    init(id: Int) {
        self.id = id
        _viewModel = StateObject(wrappedValue: DetailViewModel(id: id))
    }
    
    var body: some View {
        ScrollView {
            if let property = viewModel.property {
                // Property Image
                VStack(alignment: .leading, spacing: 24) {
                    AsyncImage(url: URL(string: property.photo)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 281)
                                .frame(maxWidth: .infinity)
                                .clipped()
                        } else if phase.error != nil {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 281)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.secondary)
                        } else {
                            ProgressView()
                                .frame(height: 281)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    // Basic Info Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("$\(property.attributes.price)")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundStyle(Color.primaryColor)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(property.projectName)
                                .font(.system(size: 19, weight: .semibold))
                            VStack(alignment: .leading, spacing: 2) {
                                Text(property.address.title)
                                Text(property.address.subtitle)
                            }
                            .font(.system(size: 14, weight: .light))
                            
                            HStack(spacing: 1.5) {
                                Image(systemName: "location.circle.fill")
                                    .font(.system(size: 16))
                                Text("View on Map")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundStyle(Color.buttonColor)
                        }
                        .foregroundStyle(Color.primaryColor)

                        HStack(spacing: 12) {
                            HStack(spacing: 3) {
                                Image(systemName: "bed.double")
                                Text("\(property.attributes.bedrooms) Beds")
                            }
                            HStack(spacing: 3) {
                                Image(systemName: "bathtub")
                                Text("\(property.attributes.bathrooms) Baths")
                            }
                            HStack(spacing: 3) {
                                Image(systemName: "square.dotted")
                                Text("\(property.attributes.areaSize) sqft")
                            }
                        }
                        .font(.system(size: 16, weight: .light))
                        .foregroundStyle(Color.primaryColor)
                    }
                    .padding(.horizontal, 24)

                    Divider()

                    // Property Details Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Property Details")
                            .font(.system(size: 19, weight: .semibold))
                        
                        VStack(alignment: .leading,spacing: 12) {
                            ForEach(property.propertyDetails, id: \.label) { detail in
                                HStack(spacing: 24) {
                                    Text("\(detail.label)")
                                        .fontWeight(.regular)
                                        .frame(width: 163, alignment: .leading)
                                    Text("\(detail.text)")
                                        .fontWeight(.light)
                                }
                            }
                        }
                        .font(.system(size: 16))
                    }
                    .foregroundStyle(Color.primaryColor)
                    .padding(.horizontal, 24)
                    Divider()

                    // Description Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Description")
                            .font(.system(size: 19, weight: .semibold))

                        Text(property.description)
                            .font(.system(size: 16, weight: .light))
                    }
                    .foregroundStyle(Color.primaryColor)
                    .padding(.horizontal, 24)
                }
                .padding(.horizontal)
            } else {
                ProgressView()
            }
        }
        .ignoresSafeArea(edges: .top)
        .task {
            await viewModel.fetchDetails()
        }
    }
}

#Preview {
    DetailView(id: 0)
}
