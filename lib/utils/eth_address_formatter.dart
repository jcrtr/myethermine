class EthAddressFormatter {
  final String address;
  EthAddressFormatter(this.address);

  String mask() {
    return "${address.substring(0, 6)}...${address.substring(address.length - 6, address.length)}";
  }
}