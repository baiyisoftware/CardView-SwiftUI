//
//  CardView.swift
//  CardView-SwiftUI
//
//  Created by Quentin on 2019/7/31.
//  Copyright © 2019 TotoroQ. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    var description: String
    
    @State var isShowDetail = false
    
    var body: some View {
        ZStack {
            TopView(subtitle: self.subtitle, title: self.title, backgroundImage: self.backgroundImage, briefSummary: self.briefSummary)
            
            if (isShowDetail) {
                ExpandedView(subtitle: subtitle, title: title, backgroundImage: backgroundImage, briefSummary: briefSummary, description: description)
            }
        }
        .animation(.interpolatingSpring(mass: 1, stiffness: 90, damping: 15, initialVelocity: 0))
    }
}


#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(subtitle: "MEET THE DEVELOPER", title: "Insider VSCO's Imaging Lab", backgroundImage: Image("bg1"), briefSummary: "How VSCO brings analog authenticity to your digital shots", description: desPlaceholer, isShowDetail: false)
            
            CardView(subtitle: "MEET THE DEVELOPER", title: "Insider VSCO's Imaging Lab", backgroundImage: Image("bg1"), briefSummary: "How VSCO brings analog authenticity to your digital shots", description: desPlaceholer, isShowDetail: true)
            
            ExpandedView(subtitle: "MEET THE DEVELOPER", title: "Insider VSCO's Imaging Lab", backgroundImage: Image("bg1"), briefSummary: "How VSCO brings analog authenticity to your digital shots", description: desPlaceholer)
        }
    }
}
#endif

struct TopView: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    
    var body: some View {
        ZStack {
            backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            //Rectangle()
            
            VStack(alignment: .center) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(subtitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .lineLimit(3)
                    
                    Spacer()
                }
                .padding()
                
                HStack(alignment: .center) {
                    Text(briefSummary)
                        .foregroundColor(.white)
                        .font(.caption)
                        .lineLimit(3)
                    Spacer()
                }
                .padding()
            }
        }
        .animation(.interpolatingSpring(mass: 1, stiffness: 80, damping: 15, initialVelocity: 2))
//        .background(
//            backgroundImage
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .clipped()
//        )
    }
}

struct ExpandedView: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    var description: String
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: true) {
                Text(self.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("bgColor1"))
            }
            .animation(.default)
            
            TopView(subtitle: self.subtitle, title: self.title, backgroundImage: self.backgroundImage, briefSummary: self.briefSummary)
        }
    }
}

//struct TopBriefView: View {
//    var subtitle: String
//    var title: String
//    var backgroundImage: Image
//    var briefSummary: String
//
//    @Binding var isShowDetail: Bool
//
//    var body: some View {
//        VStack(alignment: .leading) {
//
//            HStack {
//                VStack(alignment: .leading) {
//                    Text(subtitle)
//                        .font(.caption)
//                        .foregroundColor(.gray)
//
//                    Text(title)
//                        .font(.headline)
//                        .foregroundColor(.white)
//
//                    Spacer()
//                }
//                .lineLimit(3)
//
//                Spacer()
//            }
//
//            HStack(alignment: .center) {
//                Text(briefSummary)
//                    .foregroundColor(.white)
//                    .font(.caption)
//                    .lineLimit(3)
//                Spacer()
//            }
//        }
//        .padding()
//        .frame(height: isShowDetail ? UIScreen.main.bounds.height * 0.25 : 420)
//        .background(
//            backgroundImage
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//        )
//            .cornerRadius(isShowDetail ? 0 : 20)
//            .animation(.default)
//    }
//}
