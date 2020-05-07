function encrypt
    command docker run --rm minivault/vault encrypt $argv
    # command openssl aes-256-cbc -a -e -md sha256
end
