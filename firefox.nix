{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
	profiles.default = {

	  settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;		
	  };

	  search = {
    	    force = true;
        default = "ddg";
        order = [ "ddg" "google" ];

        engines = {

    		  "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
    	      };

          "NixOS Wiki" = {
            urls = [{
              template = "https://nixos.wiki/index.php?search={searchTerms}"; 
            }];
          
            icon = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "@nw" ];
    		  };

          "bing".metaData.hidden = true;
    		  "google".metaData.alias = "@g";
        };
      
      };

    userContent = ''
  	  @-moz-document url("about:newtab"), url("about:blank"), url("about:home") {
    	    body {
      	  background-color: #3a3a3a !important;
      	  background-image: url("/home/tom/.mozilla/firefox/default/chrome/firefox_bg.jpg") !important;
      	  background-repeat: no-repeat !important;
      	  background-position: center !important;
      	  background-size: cover !important;
    	    }
		body::before {
            content: "" !important;
            position: absolute !important;
            top: 0 !important;
            left: 0 !important;
            width: 100% !important;
            height: 100% !important;
            background-color: rgba(0, 0, 0, 0.5) !important;
            z-index: -1 !important;
        }
  	  }
	  '';

    };
    
    policies = {
        ExtensionSettings = {
          #"*".installation_mode = "blocked"; # blocks all addons except the ones specified below

          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };

		  # Hide Youtube Shorts:
          "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4563088/hide_youtube_shorts-1.8.5.xpi";
            installation_mode = "force_installed";
          };

		  # Dark Reader		
		  "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4535824/darkreader-4.9.110.xpi";
            installation_mode = "force_installed";
          };		

		  # Return Youtube Dislikes
		  "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-3.0.0.18.xpi";
            installation_mode = "force_installed";
          };
		
        };
      };
      
  };
}
