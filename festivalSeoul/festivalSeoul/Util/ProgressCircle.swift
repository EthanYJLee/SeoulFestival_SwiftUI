//
//  ProgressView.swift
//  festivalSeoul
//
//  Created by 이영진 on 2023/05/28.
//

import SwiftUI

struct ProgressCircle: View {
    @State private var isAnimating = false
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            ForEach(0 ..< 60){
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .offset(y: -80)
                    .rotationEffect(
                        .degrees(Double($0) * 30))
                    .opacity(0.05)
                
            }
            Circle()
            .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .offset(y: -80)
                        .rotationEffect(.degrees(isAnimating ? 0 : -360))
                        .animation(Animation.easeInOut(duration: 1.0))
                        .onAppear {
                           animate()
                        }
        }
    }
    private func animate() {
            withAnimation {
                isAnimating.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                animate()
            }
        }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircle()
    }
}
