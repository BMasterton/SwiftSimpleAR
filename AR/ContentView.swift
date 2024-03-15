//
//  ContentView.swift
//  AR
//
//  Created by Camosun on 2024-03-14.
//

import SwiftUI
import RealityKit
var worldAnchor: Experience.World?
var count = 0

struct ContentView : View {
    @State private var count = 0
    var body: some View {
     
        VStack {
            
          
           ARViewContainer().edgesIgnoringSafeArea(.all)
            Text(String(count))
            Button("Orbit", action: {worldAnchor!.notifications.orbitGoldBar.post()})
        }
           
                
        
    }
    
}

struct ARViewContainer: UIViewRepresentable {
    //var count: Int
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        worldAnchor = try! Experience.loadWorld()
        
        worldAnchor!.actions.axeWasHit.onAction = { entity in print("ATM was hit")
            count += 1}
        
       
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(worldAnchor!)

        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
