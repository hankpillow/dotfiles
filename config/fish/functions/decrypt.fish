function decrypt
    command docker run --rm minivault/vault decrypt $argv
     # command openssl aes-256-cbc -a -d -md sha256
end
