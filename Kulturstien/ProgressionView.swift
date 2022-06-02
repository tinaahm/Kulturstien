//
//  ProgressionView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 01/06/2022.
//

import SwiftUI

struct ProgressionView: View {
    
    @EnvironmentObject var page: ViewIndex
    
    var imageArray = ["GreyRectangleLeft", "GreyRectangleCenter", "GreyRectangleRight"]
    var quizArray = ["Kvernhus", "Sagbruket", "Demning", "Lenseanlegg"]
    var cardGameSum: Int = 200
    
    var body: some View {
        VStack () {
            
            BackButtonView()
            
            
            Text("Quiz progresjon")
                .font(.system(size: 25))

            
            VStack (alignment: .leading) {
            
            ForEach(0 ..< 4) { index in
                //VStack (alignment: .leading) {
                HStack (){
                      //  Spacer()
                Text(quizArray[index])
                            .padding()
                //Spacer()
                 
                        Spacer()
                    ForEach(0 ..< 3) { index in
                        VStack (alignment: .trailing) {
                        Image(imageArray[index])
                        .resizable()
                        .scaledToFill()
                                    .frame(width: 27, height: 27)
                                    .padding(17)
                            
                        }
                        
                        
                    }
                        
                        //Spacer()
                }
                    .padding(.trailing, 13)
                }
            
            }
            
            
            .padding()
            
            Text("Poeng")
                            .font(.system(size: 25))
                            .padding()
                        HStack () {
                            
                            Text("Minnespill -")
                            Text("\(cardGameSum)")
                            
                            
                        }
            
            
            
        
            
            
            Spacer()
        }
        
    }
}

struct ProgressionView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionView().environmentObject(ViewIndex())
    }
}
