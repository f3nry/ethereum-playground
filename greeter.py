import os

from web3 import Web3, HTTPProvider, IPCProvider

from populus.project import Project

from populus.utils.chains import (
    is_synced,
)

project = Project('.')

with project.get_chain('dev') as chain:
    provider = chain.provider

    contract = provider.get_contract('Greeter')

    print("Contract Address: %s" % contract.address)

    greeting = contract.call().greet()

    print("Current Greeting: %s" % greeting)

    new_greeting = input("New greeting: ")

    transaction = contract.transact({'from': chain.web3.eth.accounts[0]}).setGreeting(new_greeting)

    receipt = chain.web3.eth.getTransactionReceipt(transaction)

    print(receipt)

    greeting = contract.call().greet()

    print("New greeting is: %s" % greeting)
