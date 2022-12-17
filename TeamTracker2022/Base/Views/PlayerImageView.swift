//
//  PlayerImageView.swift
//  TeamTracker2022
//
//  Created by Michael Potts on 12/14/22.
//

import SwiftUI
import UIKit

struct PlayerImageView: View {
    private var fileManager = FileManager()
    var size: CGFloat
    var highlightColor: Color
    var playerImage: UIImage
    
    init(size: CGFloat = 225, color: Color = .primary, playerImageID: String? = nil) {
        self.size = size
        self.highlightColor = color
        if let imageID = playerImageID {
            self.playerImage = fileManager.retrieveImage(with: imageID) ?? UIImage(named: "noah")!
        } else {
            self.playerImage = UIImage(named: "noah")!
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: size > 125 ? 5 : 3)
                .foregroundColor(highlightColor)
                .frame(width: size, height: size)
                .shadow(color: highlightColor, radius: 10, x: 0, y: 0)
//            Image("noah")
            Image(uiImage: playerImage)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
            .frame(width: size, height: size)
        }
    }
}

struct PlayerImageView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerImageView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
