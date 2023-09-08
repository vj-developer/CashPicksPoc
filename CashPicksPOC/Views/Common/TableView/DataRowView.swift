//
//  DataRowView.swift
//  CashPicksPOC
//
//  Created by Presidio on 06/09/23.
//

import SwiftUI

struct DataRowView: View {
    var data: [String]

    var body: some View {
        ForEach(data, id: \.self) { entry in
            Text(entry)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.vertical, 15)
                .padding(.horizontal, 0)
               
        }
    }
}

struct DataRowView_Previews: PreviewProvider {
    static var previews: some View {
        DataRowView(data: [
            "Id",
            "My Dollars",
            "Entry limit",
            "Total Prizes",
            "Entires"
        ]).preferredColorScheme(.dark)
    }
}
