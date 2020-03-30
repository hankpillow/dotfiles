function decrypt
    command openssl aes-256-cbc -a -d -md sha256
end
