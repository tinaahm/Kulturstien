//
//  AvatarEditorView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 02/06/2022.
//

import SwiftUI




struct AvatarEditorView: View {
    
    @EnvironmentObject var page: ViewIndex
    
    var body: some View {
        VStack () {
            
        BackButtonView()
        
        Text("Endre avatar")
            .font(.system(size: 25))
            
            HStack (alignment: .top) {
                
                VStack () {
                    Button (action: {
                        
                        page.pageIndex = .profile
                    }) {
                        Image("Cow")
                        .resizable()
                        .frame(width: 130, height: 130)
                    }
                    Button (action: {
                        
                        page.pageIndex = .profile
                    }) {
                        Image("Troll-1")
                        .resizable()
                        .frame(width: 130, height: 130)
                    }
                    .padding()
                    Button (action: {
                        
                        page.pageIndex = .profile
                    }) {
                        Image("Bunny")
                        .resizable()
                        .frame(width: 130, height: 130)
                    }
                }
                .padding()
                
                VStack () {
                    Button (action: {
                        
                        page.pageIndex = .profile
                    }) {
                        Image("Chicken")
                        .resizable()
                        .frame(width: 130, height: 130)
                    }
                    
                    Button (action: {
                        
                        page.pageIndex = .profile
                    }) {
                        Image("Reindeer")
                        .resizable()
                        .frame(width: 130, height: 130)
                    }
                    .padding()
                }
                .padding()
                
            }
            
        
            
          Spacer()
        }
    }
}

struct AvatarEditorView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarEditorView().environmentObject(ViewIndex())
    }
}
