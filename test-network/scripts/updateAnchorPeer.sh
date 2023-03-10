
# NOTE: this must be run in a CLI container
CHANNEL_NAME=$1
CORE_PEER_LOCALMSPID=$2

peer channel update -o orderer.mbemarket.com:7050 \
 --ordererTLSHostnameOverride orderer.mbemarket.com \
 -c $CHANNEL_NAME -f ./channel-artifacts/${CORE_PEER_LOCALMSPID}anchors.tx --tls \
 --cafile $ORDERER_CA 