{ config, pkgs, lib, ... }:

{
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  security.acme = {
    acceptTerms = true;
    defaults.email = "bytomancer@gmail.com";
  };

  services.nginx = {
    enable = true;

    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;

    virtualHosts."www.bytomancer.com" = {
      enableACME = true;
      forceSSL = true;

      locations."/" = {
        proxyPass = "http://10.0.0.100:8071";
        proxyWebsockets = true;
      };
    };
  };
}
