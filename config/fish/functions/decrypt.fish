function decrypt
    # command openssl aes-256-cbc -a -d -md sha256
    command docker run --rm -v $HOME/workspace/minivault/test/:/test -v $HOME/workspace/minivault/bin/:/cli -v $HOME/workspace/minivault/extension/:/extension minivault/puppeteer:3.0.2 node cli/decrypt.js $argv
end
