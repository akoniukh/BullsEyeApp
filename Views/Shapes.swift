//
//  Shapes.swift
//  Bullseye
//
//  Created by Александр Конюх on 02.02.2022.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        Circle()
            .background(Color.green)
            .frame(width: 200, height: 100)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
