# plugin configuration
let 
  secrets = import ./secrets.nix;
in {
  plugins = {
    bufferline.enable = true;
    web-devicons.enable = true;
    lightline.enable = true;
    chadtree.enable = true;
    floaterm.enable = true;
    codecompanion = {
      enable = true;
      settings = {
        adapters = {
          anthropic = {
            __raw = ''
              function()
                return require('codecompanion.adapters').extend('anthropic', {
                    env = {
                        api_key = "${secrets.api_token}",
                   } 
                })
              end
            '';
          };
        };
        opts = {
          log_level = "TRACE";
          send_code = true;
          use_default_actions = true;
          use_default_prompts = true;
        };
        strategies = {
          agent = {
            adapter = "antropic";
          };
          chat = {
            adapter = "antropic";
          };
          inline = {
            adapter = "anthropic";
          };
        };
      };

    };
    coq-nvim.enable = true;
  };
}
