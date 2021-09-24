import SwiftUI


struct HomeView: View {
    @State private var numCardsPairs = 8 
    
    static var nf: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("MEMORY GAME")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                Spacer()
                Text("Enter the number of pairs of cards you wish to have in the game (default is 8, max is 30)")
                TextField("Enter a number", value: $numCardsPairs, formatter: HomeView.nf)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                Spacer()
                NavigationLink(destination: MemoryGameView(gameViewModel: MemoryGameViewModel(tmp: numCardsPairs))) {
                    Text("Start game")
                }
            }
            .padding()
        }
    }
}
