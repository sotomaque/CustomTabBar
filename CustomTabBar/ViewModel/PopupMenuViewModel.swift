//
//  PopupMenuViewModel.swift
//  CustomTabBar
//
//  Created by Enrique Sotomayor on 9/22/21.
//

import Foundation

enum MenuViewModel: Int, CaseIterable {
    case share
    case save
    case add
    case download
    
    // set image names
    var imageName: String {
        switch self {
            case .share: return "paperplane.fill"
            case .save: return "bookmark.fill"
            case .add: return "plus.rectangle.fill.on.rectangle.fill"
            case .download: return "square.and.arrow.down.fill"
        }
    }
    
    // set title
    var title: String {
        switch self {
            case .share: return "Share"
            case .save: return "Save"
            case .add: return "Add"
            case .download: return "Download"
        }
    }
    
    
}
