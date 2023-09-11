//
//  Topbar.swift
//  CashPicksPOC
//
//  Created by Iyyappan on 11/09/23.
//

import SwiftUI

struct Topbar: View {
    var body: some View {
        HStack(alignment: .center){
            Image("draftkings")
                .resizable()
                .frame(width: 50,height: 50)
                .cornerRadius(10)
            
            
            
            Text("CASHPICKS")
                .font(.headline.bold())
            
            HStack{
                Text("$10,250.30")
                    .font(.subheadline.bold())
                    .foregroundColor(Color(Constants.COLORS().PRIMARY_GREEN))
            }
            .padding(.horizontal,10)
            .padding(.vertical,5)
            .background(Color(Constants.COLORS().GREY))
            .cornerRadius(10)
            
            
            Image("profile")
                .resizable()
                .frame(width: 40,height: 40)
                .clipped()
                .cornerRadius(15)

            
            Image(systemName: "house")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 24, height: 24, alignment: .center)
                .padding(.all,6)
                .background(
                    Rectangle()
                        .fill(Color(Constants.COLORS().GREY))
                )
                .cornerRadius(10)
        }
        .padding(.horizontal,10)
    }
}

struct Topbar_Previews: PreviewProvider {
    static var previews: some View {
        Topbar()
            .preferredColorScheme(.dark)
    }
}
