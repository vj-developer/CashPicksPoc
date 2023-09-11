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
        TotalContestElement(
            contestID: EntryWithLink(value: "5679EFGH", link: "https://example.com/contest/5678EFGH"),
            entryFees: Entry(value: "$10"),
            entryLimit: Entry(value: "4"),
            totalPrizes: Entry(value: "$20"),
            totalEntries: EntryWithLink(value: "9,935", link: "https://example.com/contest/5678EFGH/entries")
        ),
        TotalContestElement(
            contestID: EntryWithLink(value: "5688EFGH", link: "https://example.com/contest/5678EFGH"),
            entryFees: Entry(value: "$3"),
            entryLimit: Entry(value: "10"),
            totalPrizes: Entry(value: "$20,10"),
            totalEntries: EntryWithLink(value: "9,195", link: "https://example.com/contest/5678EFGH/entries")
        ),
        // Add more test data here
    ]

    private var gridItemLayout = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            Toolbar(title: "Total Contests")
            
            Text("Your Picks were entered into these contests:")
                .font(.subheadline)
                .padding()
        
            ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 0) {
                        
                        // Headers
                        ForEach(0..<headers.count, id: \.self) { columnIndex in
                            TableItem(text: headers[columnIndex])
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.gray)
                        }
                        
                        // Contents
                        ForEach(contestList.indices, id: \.self) { index in
                            let item = contestList[index]
                                
                            Group{
                                TableItem(text: item.contestID.value)
                                TableItem(text: item.entryFees.value)
                                TableItem(text: item.entryLimit.value)
                                TableItem(text: item.totalPrizes.value)
                                TableItem(text: item.totalEntries.value)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(index % 2 == 0 ? Color.black : Color.gray)
                            
                        }
                    }
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
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




