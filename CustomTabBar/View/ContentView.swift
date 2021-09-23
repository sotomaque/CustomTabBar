//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Enrique Sotomayor on 9/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu = false;
    @ObservedObject var router = ViewRouter()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
    //            content
                Spacer()
                router.view
                Spacer()
    //            tab bar
                HStack {
                    TabIcon(viewModel: .home, router: router)
                    TabIcon(viewModel: .search, router: router)
                    TabMenu(showMenu: $showMenu)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                    TabIcon(viewModel: .notifcations, router: router)
                    TabIcon(viewModel: .account, router: router)

                }
                    .frame(height: UIScreen.main.bounds.height / 8)
                    .frame(maxWidth: .infinity)
                    .background(
                        Color(.systemGray5)
                    )
                                
            }
            
            if (showMenu) {
                PopupMenu()
                    .padding(.bottom, 144)
            }
        }.ignoresSafeArea()
     
    }
}


struct TabMenu: View {
    
    @Binding var showMenu: Bool
    
    // CONSTANTS
    let color = Color(.white)
    let c_dimensions: CGFloat = 56
    let i_dimensinos: CGFloat = 50
    let radius: CGFloat = 4
    let circleColor = Color(.systemBlue)
    
    // BODY
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: c_dimensions, height: c_dimensions)
                .shadow(radius: radius)
            
            Image(systemName: showMenu ? "xmark.circle.fill" : "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: i_dimensinos, height: i_dimensinos)
                .foregroundColor(circleColor)
                .rotationEffect(Angle(degrees: showMenu ? 90 : 0))

                
        }
        .offset(y: -44)
    }
}


struct TabIcon: View {
    
    // VIEW MODEL + ROUTER
    let viewModel: TabBarViewModel
    @ObservedObject var router: ViewRouter
    
    // CONSTANTS
    let color = Color(.white)
    let dimensions: CGFloat = 20
    
    // BODY
    var body: some View {
        Button {
            router.currentItem = viewModel
        } label: {
            Image(systemName: viewModel.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: dimensions, height: dimensions)
                .frame(maxWidth: .infinity)
                .foregroundColor(color)
        }
    }
}


// EMULATOR
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(router: ViewRouter())
            .preferredColorScheme(.dark)
    }
}

