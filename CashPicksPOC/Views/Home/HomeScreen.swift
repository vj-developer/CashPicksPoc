//
//  HomeScreen.swift
//  CashPicksPOC
//
//  Created by Iyyappan on 11/09/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
        VStack(){
            Topbar()
            
            Spacer()
            Text("Home Screen")
            Spacer()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
