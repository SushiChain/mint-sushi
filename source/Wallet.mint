enum KeyPair.Error {
  KeyPairGenerationError
}

record KeyPair {
  hexPrivateKey : String,
  hexPublicKey : String,
  hexPublicKeyX : String,
  hexPublicKeyY : String
}

module Wallet {
  fun generateKeyPair : Result(KeyPair.Error, KeyPair) {
    `
    (() => {
        try {
            return new Ok(generateValidKeyPair())
        } catch (e) {
          return new Err($KeyPair_Error_KeyPairGenerationError)
        }
         })()

    `
  }
}