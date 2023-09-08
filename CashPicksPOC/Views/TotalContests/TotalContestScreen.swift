//
//  TotalContestScreen.swift
//  CashPicksPOC
//
//  Created by Presidio on 06/09/23.
//

import SwiftUI

struct TotalContestScreen: View {
    
    var headers: [String] = ["CONTEST ID", "ENTRY FEES", "", "TOTAL PRIZES", "TOTAL ENTRIES"]
    
    let contestList: TotalContest = [
        TotalContestElement(
            contestID: EntryWithLink(value: "1434vhgvgvhgvhgvhgvhgvABCD", link: "https://example.com/contest/1434ABCD"),
            entryFees: Entry(value: "$1"),
            entryLimit: Entry(value: "150"),
            totalPrizes: Entry(value: "$10,000"),
            totalEntries: EntryWithLink(value: "9,998", link: "https://example.com/contest/1434ABCD/entries")
        ),
        TotalContestElement(
            contestID: EntryWithLink(value: "5678EFGH", link: "https://example.com/contest/5678EFGH"),
            entryFees: Entry(value: "$2"),
            entryLimit: Entry(value: "8"),
            totalPrizes: Entry(value: "$20,00"),
            totalEntries: EntryWithLink(value: "9,995", link: "https://example.com/contest/5678EFGH/entries")
        ),
//        TotalContestElement(
//            contestID: EntryWithLink(value: "5679EFGH", link: "https://example.com/contest/5678EFGH"),
//            entryFees: Entry(value: "$10"),
//            entryLimit: Entry(value: "4"),
//            totalPrizes: Entry(value: "$20"),
//            totalEntries: EntryWithLink(value: "9,935", link: "https://example.com/contest/5678EFGH/entries")
//        ),
//        TotalContestElement(
//            contestID: EntryWithLink(value: "5688EFGH", link: "https://example.com/contest/5678EFGH"),
//            entryFees: Entry(value: "$3"),
//            entryLimit: Entry(value: "10"),
//            totalPrizes: Entry(value: "$20,10"),
//            totalEntries: EntryWithLink(value: "9,195", link: "https://example.com/contest/5678EFGH/entries")
//        ),
        // Add more test data here
    ]

    
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            Toolbar(title: "Total Contests")
            
            Text("Your Picks were entered into these contests:")
                .font(.subheadline)
                .padding()
        
            
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct TableCellView: View {
    var content: String
    var isEvenRow: Bool
    
    var body: some View {
        Text(content)
            .font(.system(size: 14))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .background(isEvenRow ? Color.black : Color.gray)
    }
}

struct TableItem: View {
    var text = ""
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .padding(.vertical, 15)
            //.padding(.horizontal, 5)
    }
}

struct TotalContestScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TotalContestScreen()
                .preferredColorScheme(.light)
            TotalContestScreen()
                .preferredColorScheme(.dark)
        }
    }
}




