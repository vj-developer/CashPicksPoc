//
//  BottomTabView.swift
//  CashPicksPOC
//
//  Created by Iyyappan on 11/09/23.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            HomeScreen()
                .tabItem {
                    Label("My Picks", systemImage: "trophy")
                }
            
            CustomTabView()
                .tabItem {
                    Label("Rewards", systemImage: "gift")
                }
        }
        .accentColor(Color(Constants.COLORS().PRIMARY_GREEN))
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            BottomTabView()
                .preferredColorScheme(.light)
            BottomTabView()
                .preferredColorScheme(.dark)
        }
    }
}
