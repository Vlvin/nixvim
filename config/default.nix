{self,  ...}: {
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];
  
  colorschemes.gruvbox.enable = true;
  opts = {
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    number = true;
    relativenumber = true;
    termguicolors = true;
  
    syntax = "on";
  };

  keymaps = [
    {
      key = "<C-t>";
      action = "<cmd>CHADopen<CR>";
    }
    {
      key = "<C-q>";
      action = "<cmd>q<CR>";
    }     
    {
      key = "<C-s>";
      action = "<cmd>w<CR>";
    }
];
  plugins = {
    lightline.enable = true;
    chadtree.enable = true;

    codecompanion = {
      enable = true;
      settings = {
        adapters = {
          ollama = {
            __raw = ''
              function()
                return require('codecompanion.adapters').extend('anthropic', {
                    env = {
                        api_key = "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",
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
            adapter = "anthropic";
          };
          chat = {
            adapter = "anthropic";
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
