function encrypt
    command openssl aes-256-cbc -a -e -md sha256 
end
