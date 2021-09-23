//
//  SwiftUIView.swift
//  CustomTabBar
//
//  Created by Enrique Sotomayor on 9/22/21.
//

import SwiftUI

struct PopupMenu: View {
    var body: some View {
        HStack(spacing: 32) {
            Spacer()
            ForEach(MenuViewModel.allCases, id: \.self) {item in
                MenuItem(viewModel: item)
            }
            Spacer()
        }
        .transition(.scale)
    }
}


// EMULATOR
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PopupMenu()
    }
}
