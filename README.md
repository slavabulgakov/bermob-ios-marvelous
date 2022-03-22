# Marvelous iOS

An iOS app to explore the [Marvel API](https://developer.marvel.com/docs).

## Getting Started

First, please [get an API key](https://developer.marvel.com/signup) for the Marvel API. 

Next, save the public and private keys in a file named `KeyPair.json` in a `/Resources` directory somewhere. This will ensure that the private key is not committed to version control. For example, to use the Marvelous playground to explore the API save your key pair json in `Resources` directory of the Playground.

The key pair json should have the following format:

    {
      "publicKey": "somePublicKey",
      "privateKey": "somePrivateKey"
    }
