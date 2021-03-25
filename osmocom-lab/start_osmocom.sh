pkill osmo-hlr 
pkill osmo-msc 
pkill osmo-mgw 
pkill osmo-stp 
pkill osmo-bsc 
pkill osmo-ggsn
pkill osmo-sgsn
pkill osmo-sip-connector
pkill osmo-bts-virtual
rm /tmp/pcu_bts 2>/dev/null
nohup osmo-hlr -c /etc/osmocom/osmo-hlr.cfg                 &> nohup_hlr &
sleep 3
nohup osmo-msc -c /etc/osmocom/osmo-msc.cfg                 &> nohup_msc &
sleep 3
nohup osmo-mgw -c /etc/osmocom/osmo-mgw.cfg                 &> nohup_mgv &
sleep 3
nohup osmo-stp -c /etc/osmocom/osmo-stp.cfg                 &> nohup_stp &
sleep 3
nohup osmo-bsc -c /etc/osmocom/osmo-bsc.cfg                 &> nohup_bsc &
sleep 3
nohup osmo-ggsn -c /etc/osmocom/osmo-ggsn.cfg               &> nohup_ggsn &
sleep 3
nohup osmo-sgsn -c /etc/osmocom/osmo-sgsn.cfg               &> nohup_sgsn &
sleep 3
nohup osmo-bts-virtual -c /etc/osmocom/osmo-bts-virtual.cfg       &> nohup_bts_virtual &
sleep 3
nohup osmo-sip-connector -c /etc/osmocom/osmo-sip-connector.cfg &> nohup_sip_connector &