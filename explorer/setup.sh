export ORG1_MSPKEY=$(cd ../test-network/organizations/peerOrganizations/org1.mbemarket.com/users/Admin@org1.mbemarket.com/msp/keystore && ls *_sk) 


sed -i  "s/ORG1_MSPKEY/$ORG1_MSPKEY/g" first-network.json 