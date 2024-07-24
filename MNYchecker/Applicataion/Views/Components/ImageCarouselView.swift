//
//  ImageCarousel.swift
//  MNYchecker
//
//  Created by Савелий Коцур on 24.07.2024.
//

import SwiftUI

struct ImageCarouselView: View {
    let images: [String]
    @Binding var selectedImage: String
    @Binding var selectedColor: String
    
    var body: some View {
        VStack {
            TabView {
                ForEach(images, id: \.self) { image in
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(selectedColor))
                        .frame(width: 60, height: 60)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: selectedImage == image ? 3 : 1).foregroundColor(selectedImage == image ? .blue : .gray))
                        .onTapGesture {
                            selectedImage = image
                        }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 150)
        }
    }
}
