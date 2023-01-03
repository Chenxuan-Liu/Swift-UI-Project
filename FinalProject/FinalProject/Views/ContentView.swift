//
//  ContentView.swift
//  SwiftUIGameOfLife
//

import SwiftUI
import ComposableArchitecture
import Simulation
import Configurations
import Statistics

struct ContentView: View {
    var store: Store<AppState, AppState.Action>
 
    var body: some View {
        WithViewStore(store) { viewStore in
            TabView(selection: viewStore.binding(
                get: \.selectedTab,
                send: AppState.Action.setSelectedTab(tab:)
            )) {
                    self.simulationView()
                        .tag(AppState.Tab.simulation)
                    self.configurationsView()
                        .tag(AppState.Tab.configuration)
                    self.statisticsView()
                        .tag(AppState.Tab.statistics)
                
            }
            .accentColor(Color("accent"))
        }
    }

    private func simulationView() -> some View {
        ZStack{
            Color("simulationPastel")
                .edgesIgnoringSafeArea(.all)
            SimulationView(
                store: self.store.scope(
                    state: \.simulationState,
                    action: AppState.Action.simulationAction(action:)
                )
            )
            .padding()
            .background(Color("simulationPastel"))
        }
        .tabItem {
            Image(systemName: "play.fill")
            Text("Simulation")
            Color("accent")
        }
    }

    private func configurationsView() -> some View {
        ZStack{
            Color("configurationsPastel")
                .edgesIgnoringSafeArea(.all)
            ConfigurationsView(
                store: self.store.scope(
                    state: \.configurationState,
                    action: AppState.Action.configurationsAction(action:)
                )
            )
            .padding()
            .background(Color("configurationsPastel"))
        }
        .tabItem {
            Image(systemName: "list.bullet.circle.fill")
            Text("Configuration")
            Color("accent")
        }
    }

    private func statisticsView() -> some View {
        ZStack{
            Color("statisticsPastel")
                .edgesIgnoringSafeArea(.all)
            StatisticsView(
                store: store.scope(
                    state: \.statisticsState,
                    action: AppState.Action.statisticsAction(action:)
                )
            )
            .padding()
            .background(Color("statisticsPastel"))
        }
        .tabItem {
            Image(systemName: "folder")
            Text("Statistics")
            Color("accent")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let previewState = AppState()
    static var previews: some View {
        ContentView(
            store: Store(
                initialState: previewState,
                reducer: appReducer,
                environment: AppEnvironment()
            )
        )
    }
}
