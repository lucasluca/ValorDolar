import Foundation

struct EconomiaApiResponse: Decodable {
    let USDBRL: USDBRLData
    
    struct USDBRLData: Decodable {
        let code: String
        let codein: String
        let name: String
        let high: String
        let low: String
        let varBid: String
        let pctChange: String
        let bid: String
        let ask: String
        let timestamp: String
        let create_date: String
    }
}
