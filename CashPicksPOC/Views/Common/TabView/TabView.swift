//
//  TabView.swift
//  CashPicksPOC
//
//  Created by Presidio on 08/09/23.
//

import SwiftUI

struct CustomTabView: View {
    
    @State private var selection = 0 //selected page
    let tabLabels = ["Google", "Apple", "Microsoft", "Google", "Total Contest"]
    let tabScreens: [AnyView] = [
            AnyView(WebView(url: Constants.WEBVIEW_URLS().GOOGLE!)),
            AnyView(WebView(url: Constants.WEBVIEW_URLS().APPLE!)),
            AnyView(WebView(url: Constants.WEBVIEW_URLS().MICROSOFT!)),
            AnyView(WebView(url: Constants.WEBVIEW_URLS().GOOGLE!)),
            AnyView(TotalContestScreen())
        ]
    
    var body: some View {
        
        // With Navigation View Container
        /* NavigationView {
            VStack
         }
         .navigationBarTitle("Demo", displayMode: .inline)
         }.onChange(of: selection, perform: { value in
         //update tab
         }) */
        
        VStack {
            //ScrollableTabView
            ScrollView(.horizontal, showsIndicators: false, content: {
                ScrollViewReader { scrollReader in
                    ScrollableTabView(activeIdx: $selection,dataSet: tabLabels)
                        .padding(.top)
                        .padding(.leading,5)
                        .onChange(of: selection, perform: { value in
                            withAnimation{
                                scrollReader.scrollTo(value, anchor: .center)
                            }
                        })
                }
            })
            .background(Color(UIColor.secondarySystemFill))
            //Page View
            LazyHStack {
                PageView(selection: $selection, tabScreens: tabScreens)
            }
        }
    }
}

//MARK: Page view
struct PageView: View {
    
    @Binding var selection: Int
    let tabScreens: [AnyView]
    
    var body: some View {
        TabView(selection:$selection) {
            ForEach(0..<tabScreens.count) { i in
                tabScreens[i]
                    .tag(i)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 170)
        //give padding nav height + scrollable Tab
        .tabViewStyle(PageTabViewStyle.init(indexDisplayMode: .never))
        
    }
}

//MARK: Scrollable TabView
struct ScrollableTabView : View {
    
    @Binding var activeIdx: Int
    @State private var w: [CGFloat]
    private let dataSet: [String]
    init(activeIdx: Binding<Int>, dataSet: [String]) {
        self._activeIdx = activeIdx
        self.dataSet = dataSet
        _w = State.init(initialValue: [CGFloat](repeating: 0, count: dataSet.count))
        
    }
    
    var body: some View {
        VStack(alignment: .underlineLeading) {
            HStack {
                ForEach(0..<dataSet.count) { i in
                    Text(dataSet[i])
                        .foregroundColor(i==activeIdx ? Color.primary : Color.gray)
                        .multilineTextAlignment(.center)
                        .modifier(ScrollableTabViewModifier(activeIdx: $activeIdx, idx: i))
                        .background(TextGeometry())
                        .onPreferenceChange(WidthPreferenceKey.self, perform: { self.w[i] = $0 })
                        .id(i)
                    
                    
                    Spacer().frame(width: 20)
                }
            }
            //.padding(.horizontal, 5)
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [ Color("GradientStartBlue"), Color("GradientEndPurple")]), startPoint: .leading, endPoint: .trailing)
                )
                .alignmentGuide(.underlineLeading) { d in d[.leading]  }
                .frame(width: w[activeIdx],  height: 4)
                .animation(.linear, value: 0)
                .cornerRadius(3, corners: [.topLeft, .topRight])
            
        }
    }
}

struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue = CGFloat(0)
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
    typealias Value = CGFloat
}

struct TextGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            return Rectangle().fill(Color.clear).preference(key: WidthPreferenceKey.self, value: geometry.size.width)
        }
    }
}

struct ScrollableTabViewModifier: ViewModifier {
    @Binding var activeIdx: Int
    let idx: Int
    
    func body(content: Content) -> some View {
        Group {
            if activeIdx == idx {
                content.alignmentGuide(.underlineLeading) { d in
                    return d[.leading]
                }.onTapGesture {
                    withAnimation{
                        self.activeIdx = self.idx
                    }
                }
                
            } else {
                content.onTapGesture {
                    withAnimation{
                        self.activeIdx = self.idx
                    }
                }
            }
        }
    }
}

extension HorizontalAlignment {
    private enum UnderlineLeading: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.leading]
        }
    }
    
    static let underlineLeading = HorizontalAlignment(UnderlineLeading.self)
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CustomTabView()
                .preferredColorScheme(.light)
            CustomTabView()
                .preferredColorScheme(.dark)
        }
    }
}
