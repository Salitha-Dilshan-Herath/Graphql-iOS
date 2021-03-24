//
//  Apollo.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
            let client = URLSessionClient()
            let cache = InMemoryNormalizedCache()
            let store = ApolloStore(cache: cache)
            let provider = NetworkInterceptorProvider(client: client, store: store)
            let url = URL(string: "https://api.github.com/graphql")!
            let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                         endpointURL: url)
        return ApolloClient(networkTransport: transport, store: store)
        }()
    
}

class NetworkInterceptorProvider: LegacyInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}

class CustomInterceptor: ApolloInterceptor {

    let token = "1a665a82e685867930578d8527943662a1914970"
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        
        request.addHeader(name: "Authorization", value: "Bearer \(token)")

        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
