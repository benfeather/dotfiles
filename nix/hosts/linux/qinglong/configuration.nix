{
  config,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    "${modulesPath}/virtualisation/lxc-container.nix"
    ./incus.nix
    ./orbstack.nix
  ];

  # Environment Packages
  environment.systemPackages = with pkgs; [
    git
    nodejs
  ];

  # OrbStack Defaults:
  # ****************************************************************

  users.users.ben = {
    uid = 501;
    extraGroups = [
      "wheel"
      "orbstack"
    ];
    isSystemUser = true; # simulate isNormalUser, but with an arbitrary UID
    group = "users";
    createHome = true;
    home = "/home/ben";
    homeMode = "700";
    shell = pkgs.fish;
  };

  security.sudo.wheelNeedsPassword = false;

  users.mutableUsers = false; # This being `true` leads to a few nasty bugs, change at your own risk!

  networking = {
    dhcpcd.enable = false;
    useDHCP = false;
    useHostResolvConf = false;
  };

  systemd.network = {
    enable = true;
    networks."50-eth0" = {
      matchConfig.Name = "eth0";
      networkConfig = {
        DHCP = "ipv4";
        IPv6AcceptRA = true;
      };
      linkConfig.RequiredForOnline = "routable";
    };
  };

  # Extra certificates from OrbStack.
  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIDKDCCAhCgAwIBAgIRAP/8H127Voa/WXZ0q6Q+w+0wDQYJKoZIhvcNAQELBQAw
      PTELMAkGA1UEBhMCRU4xEDAOBgNVBAoMB0FkR3VhcmQxHDAaBgNVBAMME0FkZ3Vh
      cmQgUGVyc29uYWwgQ0EwHhcNMjUwNDE2MDYwNjQzWhcNNDUwNDExMDYwNjQzWjA9
      MQswCQYDVQQGEwJFTjEQMA4GA1UECgwHQWRHdWFyZDEcMBoGA1UEAwwTQWRndWFy
      ZCBQZXJzb25hbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJrO
      A6+bv27n4tViX0QBKfq/4NjnlnE+qX+ncGzwbZpWU2KHgAn1KnDOxtVN88RAQcr3
      9AY1iPlJ89TK63U+lAh1WO7PxcgyoRiVp+KsJf5HCiAhjkNfF8EWiUsf5mIy0W+R
      aIJ5+ytvs/xLdPuKFNOsQBxU8ogBBuW2e0o7E/kpE3k2d/ZR3ozvwrrczzXVy5BU
      QhoX1nccjmJUxThfmaYsG+67REQhxhH7D7vy1669gVXeEuz9fgDnR169wt/KsCVp
      RLZS2VAaDgYHq6QJz5OjPuWRO39HU6X15f4PMq4yJjfzv19Sy9BScFA246gPL/uJ
      rT/judUGEdKQr7SaqB0CAwEAAaMjMCEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8B
      Af8EBAMCAQYwDQYJKoZIhvcNAQELBQADggEBAFUEApftV80IUtzD3Y+vjiwNtzl4
      0ZJdOsgZSCmakr6leWsORqNSpPwnReVC6eEkEZus3SPg5AyFNcq/lC9RTU0zfZ5u
      QzoszK4NjbwUeHYbZNM+O3STSoLblGv/qLAQ9EUPSE50oxVBGO3HTR9me/AgJXvz
      oi52crbU0FL92SL++y7JcOuBkrV7tRnjzUjS2f6jt8vXY4Rif3+CY7LWsG4g2iVE
      cWCKBDAg5+VE8nbRudYZ46nYLF1tJiFyHuQXe75mtlA5gN1Sf5JdcWZbEw4LVcFg
      wW6XB/lVs63pT46yx2ufh2rMmmXQdzJNs3gzuxrcCC1LtGh4T8wh93+lgzI=
      -----END CERTIFICATE-----

      -----BEGIN CERTIFICATE-----
      MIIErTCCAxWgAwIBAgIQTvvNJbV18qzTCMxVnGFFcDANBgkqhkiG9w0BAQsFADBv
      MR4wHAYDVQQKExVta2NlcnQgZGV2ZWxvcG1lbnQgQ0ExIjAgBgNVBAsMGWJlbkBr
      aXRzdW5lIChCZW4gRmVhdGhlcikxKTAnBgNVBAMMIG1rY2VydCBiZW5Aa2l0c3Vu
      ZSAoQmVuIEZlYXRoZXIpMB4XDTI1MDYxODAwMTQwNFoXDTM1MDYxODAwMTQwNFow
      bzEeMBwGA1UEChMVbWtjZXJ0IGRldmVsb3BtZW50IENBMSIwIAYDVQQLDBliZW5A
      a2l0c3VuZSAoQmVuIEZlYXRoZXIpMSkwJwYDVQQDDCBta2NlcnQgYmVuQGtpdHN1
      bmUgKEJlbiBGZWF0aGVyKTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGB
      ALPDoh0W+tjxCJD9naEU+97A071C1WkUDPLg+yTHt2O7X/dHwtrEAcFGz2b2RRN3
      0QPvuyycW7EUUFGNnDbzxO5KeVqnoiOh+QwZHvTSNXtT6ngMN5w/tbiKuNAmA4NP
      XoHwCiTj9pykTT5MW8TbrNNQqzvZ3SG3SUEmzkCzazWPYjYpM30FsoCjfMpw8H3K
      QuEzU9m74H7M2uLaivPgjPOTSZu3SiMS+yDEmjbKvb3M3B47CQOy4b31rgrAsE/E
      Z/ua8CTAHxPFEj2mKrMtBon8gUvISa05qRbwL+3b1wLJGQLOi2oI1xyO9KdJaUUT
      dmKnXtjr0su2cDNv5QPauyDStUy26Fq5OE/YGWyFgdNaykX6DJB3QxMQJp2bio4Y
      7npNPiooFRVD9795lVlPa2ihoMYPj7wxYlaYhP06oehF2aanSkhtoeLZu0PrJBKn
      /a0l9pnXVoJGuMz9PJofZkqRXeWFIEcBG00laauFH4zVK1eh4PeMVnOaSqcOjlI9
      OwIDAQABo0UwQzAOBgNVHQ8BAf8EBAMCAgQwEgYDVR0TAQH/BAgwBgEB/wIBADAd
      BgNVHQ4EFgQUf3Hxpb7Nn3Xj7wCqXhBkJuMinocwDQYJKoZIhvcNAQELBQADggGB
      ACawDHrpWJ+RpjMdP3pXHvxhTYQtWA5Hcsw8lRe7uFKyLrxQUqdZp7W3rE3iiWbK
      UCVzAao6WIUFjywOqufKPNNE6OIZqAZm7GB3rkbNIVw8nk2sBw1Hr4fbXHP2hb7M
      aiVjZ5UetHkqCaTYe7QwGrWjG4cyklAa7MBw/I88H0da203RduA08sCN1+hnoxqP
      u2C8lAmyFu/jbfzFQ5Kx22Knp41Ywgh3RihK45I+TiPn1e83lO6MBEjUgXQT+adB
      zT3LVHiJRqz1fAV3XNicizeN1+f18Tkxbi7XwX5s1Wq14Da12UTQw1IswPKMykgU
      X6OjlBHvQTVErA2ZyGmQGlhBTqTpTc7orknFs+BH4mcNMWJWGkN7hu6DN/hHrlRf
      38AsEb3ffcldMKaIVzlYKkN/xIBSTwJXA4402BF9HU8gFLNpr8k/trgRNGv8B8Bs
      ObIpg8B18teMts6FIRELUk1WZwGTbtf17gsqseoakNcfq4ztbe4BrIr/5KkQLaCj
      Tg==
      -----END CERTIFICATE-----

      -----BEGIN CERTIFICATE-----
      MIICCzCCAbKgAwIBAgIQbOQLK/McrZANPHeGeZXxNjAKBggqhkjOPQQDAjBmMR0w
      GwYDVQQKExRPcmJTdGFjayBEZXZlbG9wbWVudDEeMBwGA1UECwwVQ29udGFpbmVy
      cyAmIFNlcnZpY2VzMSUwIwYDVQQDExxPcmJTdGFjayBEZXZlbG9wbWVudCBSb290
      IENBMB4XDTI1MDQxNzA4MzMzNloXDTM1MDQxNzA4MzMzNlowZjEdMBsGA1UEChMU
      T3JiU3RhY2sgRGV2ZWxvcG1lbnQxHjAcBgNVBAsMFUNvbnRhaW5lcnMgJiBTZXJ2
      aWNlczElMCMGA1UEAxMcT3JiU3RhY2sgRGV2ZWxvcG1lbnQgUm9vdCBDQTBZMBMG
      ByqGSM49AgEGCCqGSM49AwEHA0IABEr/t6OW+GhVNuaZfFKbubCH+4aAWHz/K1v0
      8Wa5mnfiMF9xrYjJ5BjFs1QE4HqTixyfz3UfLEkBOgEAjoqxmzijQjBAMA4GA1Ud
      DwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBR5dowB0s1EQjpZ
      nmevdmPjC4Jl6zAKBggqhkjOPQQDAgNHADBEAiApfvm0nSy2AbNYq91xxQYIqSmy
      U/KWaZsEd3yEuNBUDAIgTh3I/9dK0XCcq3E6aQUMhLykOCALcc3KX1pS3sOxRwc=
      -----END CERTIFICATE-----
    ''
  ];
}
