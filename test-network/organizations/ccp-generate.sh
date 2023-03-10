#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.json
}

function yaml_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.yaml | sed -e $'s/\\\\n/\\\n          /g'
}


function Org1CCP {
    ORG=1
    P0PORT=7051
    CAPORT=7054
    PEERPEM=organizations/peerOrganizations/org1.mbemarket.com/tlsca/tlsca.org1.mbemarket.com-cert.pem
    CAPEM=organizations/peerOrganizations/org1.mbemarket.com/ca/ca.org1.mbemarket.com-cert.pem

    echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org1.mbemarket.com/connection-org1.json
    echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org1.mbemarket.com/connection-org1.yaml

}

function Org2CCP {
    ORG=2
    P0PORT=9051
    CAPORT=8054
    PEERPEM=organizations/peerOrganizations/org2.mbemarket.com/tlsca/tlsca.org2.mbemarket.com-cert.pem
    CAPEM=organizations/peerOrganizations/org2.mbemarket.com/ca/ca.org2.mbemarket.com-cert.pem

    echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org2.mbemarket.com/connection-org2.json
    echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org2.mbemarket.com/connection-org2.yaml

}

function Org3CCP {

    ORG=3
    P0PORT=11051
    CAPORT=9054
    PEERPEM=organizations/peerOrganizations/org3.mbemarket.com/tlsca/tlsca.org3.mbemarket.com-cert.pem
    CAPEM=organizations/peerOrganizations/org3.mbemarket.com/ca/ca.org3.mbemarket.com-cert.pem

    echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org3.mbemarket.com/connection-org3.json
    echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/org3.mbemarket.com/connection-org3.yaml

}