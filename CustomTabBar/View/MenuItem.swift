//
//  MenuItem.swift
//  CustomTabBar
//
//  Created by Enrique Sotomayor on 9/22/21.
//
import SwiftUI


struct MenuItem: View {
    let viewModel: MenuViewModel
    
    // CONSTANTS
    let color = Color(.systemBlue)
    let c_dimensions: CGFloat = 50
    let i_dimensinos: CGFloat = 50
    let paddingSize: CGFloat = 12
    let radius: CGFloat = 4
    let circleColor = Color(.white)
    
    // BODY
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            ZStack {
                Circle()
                    .foregroundColor(color)
                    .frame(width: c_dimensions, height: c_dimensions)
                    .shadow(radius: radius)
                
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(paddingSize)
                    .frame(width: i_dimensinos, height: i_dimensinos)
                    .foregroundColor(circleColor)
            }
            
            Text(viewModel.title)
                .foregroundColor(.white)
                .font(.footnote)
        }
    }
}
