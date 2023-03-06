//
//  AppStyle.swift
//  poke-test
//
//  Created by Samantha Cruz on 28/2/23.
//

import UIKit

struct AppStyle {
    static func configureAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black,
                                          .font: UIFont.boldSystemFont(ofSize: 20)]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor.gray
        UIScrollView.appearance().bounces = false
    }
}
