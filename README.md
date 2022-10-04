# Marvelous iOS

## About

Marvelous is a simple iOS app to explore the [Marvel API](https://developer.marvel.com/docs).

At [diconium](https://diconium.com/en) we are [hiring](https://jobs.diconium.com/en/offer/senior-ios-developer-all-genders/540268) iOS developers. This repository contains the code base that we use to do pair work with candidates during the "technical" part of our recruitment process. We find it useful because it allows us to simulate how we work together with candidates in a way that is more lightweight and playful than the large, commercial software projects that are our normal day to day work. This way we can show how we work, find out how prospective employees like to work, and do it all while collaborating on some (more or less) working software.

## Getting Started

### Prerequisites

At minimum Xcode 13.3 is required for the workspace to work correctly. The command line tools should also be installed. These should be the only prerequisites required for the code to compile and run.

### Access to the Marvel API

In order to actually get data from the Marvel API you will need an [API key](https://developer.marvel.com/signup).

When you have one save the public and private keys in a file named `KeyPair.json` in a `/Resources` directory somewhere. This will ensure that the private key is not committed to version control. For example, to use the Marvelous playground to explore the API save your key pair json in `Resources` directory of the Playground.

The key pair json should have the following format:

    {
      "publicKey": "somePublicKey",
      "privateKey": "somePrivateKey"
    }

## Getting help

If you are experiencing problems please [open an issue](https://github.com/diconium/bermob-ios-marvelous/issues) and we will try to address it as soon as we can. Please assign @eugenpirogoff on GitHub to it.

## Preparing for the interview

Please clone the repository, open the workspace, and familiarise yourself with the codebase. You don't need to understand every detail, but you should at least know what it does. You should also take a look at the [wiki](https://github.com/diconium/bermob-ios-marvelous/projects/1/) and have chosen an issue for us to work on during the pairing session. [This issue](https://github.com/diconium/bermob-ios-marvelous/issues/10) could be a good starting point for example.
