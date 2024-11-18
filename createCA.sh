echo "Setting up the directories"
mkdir ./sslCA
echo "sslCA"
mkdir ./sslCA/certs
echo "sslCA/certs"
mkdir ./sslCA/private
echo "sslCA/private"
mkdir ./sslCA/newcerts
echo "sslCA/newcerts"

echo "Initialize the CA"
cd ./sslCA
echo 1000 > serial
touch index.txt

echo "Creating the CA"
echo "Use a strong password and keep it safe!"
openssl req -new -newkey rsa:2048 -x509 -days 3650 -extensions v3_ca -keyout private/cakey.pem -out cacert.pem -config ../ca.cnf

echo "Review the generated files"
more ./cacert.pem
more ./private/cakey.pem

echo "sslCA/cacert.pem"
echo "sslCA/private/cakey.pem"
echo "CA created!!!"