{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
	  profiles.default = {

	  settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;		
        "browser.toolbars.bookmarks.visibility" = "always";
	  };

	  bookmarks = {
	    force = true;
	    settings = [
	      {
	        name = "Uni";
	        toolbar = true;
	        bookmarks = [
	          {
	            name = "StudIP";
	            keyword = "StudIP";
	            url = "https://studip.tu-braunschweig.de/dispatch.php/my_courses";
            }
            {
              name = "Outlook";
              url = "https://mail.tu-braunschweig.de/owa/auth/logon.aspx?replaceCurrent=1&url=https%3a%2f%2fmail.tu-braunschweig.de%2fowa%2f";
            }
            {
              name = "TU Connect";
              url = "https://connect.tu-braunschweig.de/qisserver/pages/cs/sys/portal/hisinoneStartPage.faces";
            }
          ];
	      }

        {
	        name = "NixOS";
	        toolbar = true;
	        bookmarks = [
	          {
	            name = "NixOS Wiki";
	            keyword = "StudIP";
	            url = "https://nixos.wiki/";
            }
            {
              name = "Wiki NixOS";
              url = "https://wiki.nixos.org/wiki/NixOS_Wiki";
            }
            {
              name = "Nix Packages";
              url = "https://search.nixos.org/packages";
            }
            {
              name = "Nix Options";
              url = "https://search.nixos.org/options";
            }
            {
              name = "HomeManager Appendix";
              url = "https://nix-community.github.io/home-manager/options.xhtml";
            }
          ];
	      }
      ];
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

    		  "youtube" = {
            urls = [{
              template = "https://www.youtube.com/results?search_query={searchTerms}"; # Correct template URL
            }];
            icon = "https://www.youtube.com/favicon.ico"; # Add a valid icon URL
            definedAliases = [ "@y" ];
          };

          "bing".metaData.hidden = true;
    		  "google".metaData.alias = "@g";
        };
        
      };

    userContent = ''
        @-moz-document url("about:home"), url("about:newtab") {
          body {
            background-image: url("https://wallpapercave.com/wp/wp13416663.jpg") !important;
            background-repeat: no-repeat !important;
            background-position: center !important;
            background-size: cover !important;
            background-attachment: fixed !important; 
          }

          body:before {
            content: "" !important;
            position: absolute !important;
            top: 0 !important;
            left: 0 !important;
            width: 100% !important;
            height: 100% !important;
            background-color: rgba(0, 0, 0, 0.5) !important;
            z-index: -1 !important;
          }

          main {
            justify-content: start;
          }
        }        
      '';

   };
    
    policies = {
      DisplayBookmarksToolbar = "always";
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
