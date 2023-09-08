//
//  Toolbar.swift
//  CashPicksPOC
//
//  Created by Presidio on 06/09/23.
//

import SwiftUI

struct Toolbar: View {
    
    var title = ""
    
    var body: some View {
        HStack(){
            Image(systemName: "chevron.backward")
                .bold()
            
            Text(title)
                .bold()
                .frame(maxWidth: .infinity)
            
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar(title: "Total Contests")
    }
}
