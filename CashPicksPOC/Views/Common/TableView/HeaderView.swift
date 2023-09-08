//
//  HeaderView.swift
//  CashPicksPOC
//
//  Created by Presidio on 06/09/23.
//

import SwiftUI

struct HeaderView: View {
    var headers: [String]

    var body: some View {
        ForEach(headers, id: \.self) { entry in
            Text(entry)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.vertical, 15)
                .padding(.horizontal, 0)
                
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        var headers: [String] = ["CONTEST ID", "ENTRY FEES", "", "TOTAL PRIZES", "TOTAL ENTRIES"]
        HeaderView(headers: headers)
            .preferredColorScheme(.dark)
    }
}
