//
//  DefaultFetchMovieUseCase.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//
import Apollo
import Combine
import Foundation
import ApolloWebSocket
import IMDbAPI

struct DefaultFetchMovieUseCase: FetchMovieUseCase {
    private static let urlPath = "graph.imdbapi.dev/v1"
    
    private var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache ()
        let store = ApolloStore (cache: cache)

        let url = URL(string: "https://\(urlPath)")!
        let transport = RequestChainNetworkTransport(interceptorProvider: DefaultInterceptorProvider(client:client,
                                                                                                     shouldInvalidateClientOnDeinit: true,
                                                                                                     store: store),
                                                     endpointURL: url)
        let webSocket = WebSocket(url: URL(string: "ws://\(urlPath)")!, protocol: .graphql_transport_ws)
            let webSocketTransport = WebSocketTransport (websocket: webSocket)
            let splitTransport = SplitNetworkTransport (
                uploadingNetworkTransport: transport, webSocketNetworkTransport: webSocketTransport
            )
            return ApolloClient (networkTransport: splitTransport, store: store)
            }()
    
    func fetchMovie(id: String) -> AnyPublisher<MovieDetails, any Error> {
        return Future { promise in
            apollo.fetch(query: MovieDetailsQuery(id: id)) { result in
                        switch result {
                        case .success(let graphQLResult):
                            if let title = graphQLResult.data?.title{
                                promise(.success(title.mapToMovieDetails()))
                            } else {
                                promise(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No movie found"])))
                            }
                        case .failure(let error):
                            promise(.failure(error))
                        }
                    }
                }
                .eraseToAnyPublisher()
    }
}
