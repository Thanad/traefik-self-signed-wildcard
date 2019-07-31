create-cert:
	openssl genrsa -out certs/cert.key 2048
	openssl req -new -out certs/cert.csr -key certs/cert.key -config openssl.cnf
	openssl x509 -req -days 3650 -in certs/cert.csr -signkey certs/cert.key -out certs/cert.crt -extensions v3_req -extfile openssl.cnf

add-trust-cert:
	sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain certs/cert.crt
