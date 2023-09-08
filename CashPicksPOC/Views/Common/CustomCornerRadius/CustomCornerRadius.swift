//
//  CustomCornerRadiusShapeView.swift
//  CashPicksPOC
//
//  Created by Presidio on 08/09/23.
//

import SwiftUI

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct CustomCornerRadiusRectangle_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [ Color("GradientStartBlue"), Color("GradientEndPurple")]), startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: .infinity,  height: 8)
                .cornerRadius(5, corners: [.topLeft, .topRight])
                .padding()
                .preferredColorScheme(.light)
        }
    }
}

