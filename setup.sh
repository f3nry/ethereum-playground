#/bin/bash

if hash python3 2>/dev/null; then
    echo "Python 3 installed, continuing."
else
    echo "Python 3 is not installed. Please see https://www.python.org/downloads/"
    exit 1
fi

echo "Updating brew..."

brew update
brew upgrade

echo "Tapping ethereum.."

brew tap ethereum/ethereum

echo "Installing solidity.."

brew install solidity
brew linkapps solidity

echo "Installing populus dependencies.."

brew install pkg-config libffi autoconf automake libtool openssl

echo "Install populus.."

# Flags required on MacOSX 10.10+. See https://github.com/pyca/cryptography/issues/2350 for more details.
env LDFLAGS="-L$(brew --prefix openssl)/lib" CFLAGS="-I$(brew --prefix openssl)/include" python3.6 -m pip3 install populus

echo "Run the following to setup the python path:"
echo "\$(eval ./env.sh)"
