//
//  DetailView.swift
//  99 Group iOS Exercise
//
//  Created by Ezra Arya Wijaya on 01/11/24.
//
import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            //Property Image
            VStack(alignment: .leading, spacing: 24) {
                AsyncImage(url: URL(string: "https://picsum.photos/id/10/450/300")) { phase in
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
                
                //Basic Info Section
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("$5,700")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundStyle(Color.primaryColor)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Parkview Apartment")
                                .font(.system(size: 19, weight: .semibold))
                            VStack(alignment: .leading, spacing: 2) {
                                Text("1 Keppel Bay View · Condo for Rent")
                                Text("Telok Blangah / Harbourfront (D4)")
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
                                Text("3 Beds")
                            }
                            HStack(spacing: 3) {
                                Image(systemName: "bathtub")
                                Text("2 Baths")
                            }
                            HStack(spacing: 3) {
                                Image(systemName: "square.dotted")
                                Text("1,420 sqft")
                            }
                        }
                        .font(.system(size: 16, weight: .light))
                        .foregroundStyle(Color.primaryColor)
                    }

                    Divider()

                    // Property Details Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Property Details")
                            .font(.system(size: 19, weight: .semibold))

                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Price/sqft")
                                Text("Floor Level")
                                Text("Furnishing")
                                Text("Facing")
                                Text("Overlooking view")
                                Text("Built year(TOP)")
                                Text("Tenure")
                                Text("Property type")
                                Text("Last updated")
                            }
                            .font(.system(size: 16, weight: .regular))
                            .frame(idealWidth: 163)
                            VStack(alignment: .leading, spacing: 12) {
                                Text("$1,420 psf")
                                Text("High (40 total)")
                                Text("Unfurnished")
                                Text("North")
                                Text("Park View")
                                Text("2020")
                                Text("99-year leasehold")
                                Text("Condo")
                                Text("2 min ago")
                            }
                            .font(.system(size: 16, weight: .light))
                            .frame(idealWidth: 163)
                        }
                    }
                    .foregroundStyle(Color.primaryColor)

                    Divider()
                    
                    // Description Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Description")
                            .font(.system(size: 19, weight: .semibold))

                        Text("Sit back and enjoy panorama views of Mount Faber and Sentosa. The views are just as good from inside this modern apartment, where sunlight pours in through walls of windows. Reflections at Keppel Bay in Singapore is a luxury waterfront residential complex on approximately 84,000 m² of land with 750m of shoreline. It was completed in 2011, offering …")
                            .font(.system(size: 16, weight: .light))
                    }
                    .foregroundStyle(Color.primaryColor)

                }
                .padding(.horizontal, 24)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    DetailView()
}
