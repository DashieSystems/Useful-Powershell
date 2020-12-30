# Connection Variables
$connectionName = "Your Company Name Here"
$serverIp = "127.0.0.1"
$l2tpPsk = "psk string here"


$vpnStatus = Get-VpnConnection # Get current VPNs
$vpnFacts = $vpnStatus.Name -contains "$connectionName" # Check current VPNs for the specified connection name

# Pretty straight forward, if connection is present, write a message which stops. If connection isn't present, write a message and add the connection with specified variables
If ($vpnFacts -eq 'true') {
  Write-Host "VPN already present."
} else {
  Write-Warning -Message "No VPN detected. Creating..."

  Add-VpnConnection -Name "$connectionName" -ServerAddress "$serverIp" -TunnelType L2tp -EncryptionLevel Optional -L2tpPsk "$l2tpPsk" -AuthenticationMethod MSChapv2 -Force
}