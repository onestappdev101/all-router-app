import 'package:drift/drift.dart';
import 'database.dart';

class SeedData {
  static const List<BrandsCompanion> initialBrands = [
    BrandsCompanion(
      name: Value('TP-Link'),
      website: Value('https://www.tp-link.com'),
      logo: Value('assets/logos/tp_link_logo.webp'),
      dns: Value('tplinkwifi.net'),
      notes: Value('Supports HTTP/HTTPS web UI and TDP/TMP UDP discovery protocols.'),
    ),
    BrandsCompanion(
      name: Value('ASUS'),
      website: Value('https://www.asus.com'),
      logo: Value('assets/logos/asus_logo.webp'),
      dns: Value('router.asus.com'),
      notes: Value('Supports Asuswrt HTTP/HTTPS API and NVRAM-based endpoints.'),
    ),
    BrandsCompanion(
      name: Value('Netgear'),
      website: Value('https://www.netgear.com'),
      logo: Value('assets/logos/netgear_logo.webp'),
      dns: Value('routerlogin.net'),
      notes: Value('Supports Genie Web GUI and SOAP API endpoints.'),
    ),
    BrandsCompanion(
      name: Value('D-Link'),
      website: Value('https://www.dlink.com'),
      logo: Value('assets/logos/dlink_logo.webp'),
      dns: Value('dlinkrouter.local'),
      notes: Value('Supports HNAP protocol and standard Web GUI.'),
    ),
    BrandsCompanion(
      name: Value('Huawei'),
      website: Value('https://www.huawei.com'),
      logo: Value('assets/logos/huawei_logo.webp'),
      dns: Value.absent(),
      notes: Value('Supports Huawei HiLink and Hilink XML/JSON API.'),
    ),
    BrandsCompanion(
      name: Value('Xiaomi / Redmi'),
      website: Value('https://www.mi.com'),
      logo: Value('assets/logos/xiaomi_logo.webp'),
      dns: Value('miwifi.com'),
      notes: Value('Supports MiWiFi OpenWrt-based LuCI and JSON RPC.'),
    ),
    BrandsCompanion(
      name: Value('MikroTik'),
      website: Value('https://mikrotik.com'),
      logo: Value('assets/logos/mikrotik_logo.webp'),
      dns: Value.absent(),
      notes: Value('RouterOS with REST API and Winbox protocol.'),
    ),
    BrandsCompanion(
      name: Value('Tenda'),
      website: Value('https://www.tendacn.com'),
      logo: Value('assets/logos/tenda_logo.webp'),
      dns: Value('tendawifi.com'),
      notes: Value('Supports goform/Web GUI endpoints.'),
    ),
    BrandsCompanion(
      name: Value('Linksys'),
      website: Value('https://www.linksys.com'),
      logo: Value('assets/logos/linksys_logo.webp'),
      dns: Value('myrouter.local'),
      notes: Value('Supports Smart Wi-Fi and JNAP protocols.'),
    ),
    BrandsCompanion(
      name: Value('AVM (FRITZ!Box)'),
      website: Value('https://en.avm.de'),
      logo: Value('assets/logos/fritzbox_logo.webp'),
      dns: Value('fritz.box'),
      notes: Value('Supports TR-064 and AHA-HTTP interface.'),
    ),
    BrandsCompanion(
      name: Value('OpenWrt'),
      website: Value('https://openwrt.org'),
      logo: Value('assets/logos/openwrt_logo.webp'),
      dns: Value.absent(),
      notes: Value('Open-source Linux distribution using LuCI RPC and ubus.'),
    ),
    BrandsCompanion(
      name: Value('Mercusys'),
      website: Value('https://www.mercusys.com'),
      logo: Value('assets/logos/mercusys_logo.webp'),
      dns: Value('mwlogin.net'),
      notes: Value('Sub-brand of TP-Link, uses similar web interface.'),
    ),
    BrandsCompanion(
      name: Value('Totolink'),
      website: Value('https://www.totolink.net'),
      logo: Value('assets/logos/totolink_logo.webp'),
      dns: Value('itotolink.net'),
      notes: Value('Supports standard web management portal.'),
    ),
    BrandsCompanion(
      name: Value('ZTE'),
      website: Value('https://www.ztedevices.com'),
      logo: Value('assets/logos/zte_logo.webp'),
      dns: Value.absent(),
      notes: Value('Supports goform JSON and Web GUI.'),
    ),
    BrandsCompanion(
      name: Value('Ubiquiti / UniFi'),
      website: Value('https://ui.com'),
      logo: Value('assets/logos/ubiquiti_logo.webp'),
      dns: Value.absent(),
      notes: Value('EdgeOS and UniFi Controller API.'),
    ),
    BrandsCompanion(
      name: Value('Keenetic'),
      website: Value('https://keenetic.com'),
      logo: Value('assets/logos/keenetic_logo.webp'),
      dns: Value('my.keenetic.net'),
      notes: Value('KeeneticOS with NDM-RPC and Web UI.'),
    ),
    BrandsCompanion(
      name: Value('Generic / Unknown'),
      website: Value.absent(),
      logo: Value('assets/logos/router_placeholder.webp'),
      dns: Value.absent(),
      notes: Value('Fallback profile for generic or unrecognized routers.'),
    ),
  ];

  static const List<FirmwareTypesCompanion> initialFirmwareTypes = [
    FirmwareTypesCompanion(name: Value('Stock')),
    FirmwareTypesCompanion(name: Value('OpenWrt')),
    FirmwareTypesCompanion(name: Value('Asuswrt-Merlin')),
    FirmwareTypesCompanion(name: Value('FreshTomato')),
    FirmwareTypesCompanion(name: Value('DD-WRT')),
    FirmwareTypesCompanion(name: Value('Padavan')),
    FirmwareTypesCompanion(name: Value('Gargoyle')),
    FirmwareTypesCompanion(name: Value('ImmortalWrt')),
    FirmwareTypesCompanion(name: Value('GL.iNet OS')),
    FirmwareTypesCompanion(name: Value('OPNsense')),
    FirmwareTypesCompanion(name: Value('pfSense')),
    FirmwareTypesCompanion(name: Value('VyOS')),
    FirmwareTypesCompanion(name: Value('Custom / Other')),
  ];
}

