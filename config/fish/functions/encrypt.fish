function encrypt
    command docker run --rm minivault/encrypt:1.5.0 $argv
end
# function encrypt
#     # command openssl aes-256-cbc -a -e -md sha256
#     command docker run --rm -v $HOME/workspace/minivault/test/:/test -v $HOME/workspace/minivault/bin/:/cli -v $HOME/workspace/minivault/extension/:/extension minivault/puppeteer:3.0.2 node cli/encrypt.js $argv
# end
