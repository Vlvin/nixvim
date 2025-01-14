{self, ...}: {
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
    treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        nix
        markdown
        yaml
      ];
    };
    codecompanion = {
      enable = true;
      settings = {
        adapters = {
          ollama = {
            __raw = ''
              function()
                return require('codecompanion.adapters').extend('ollama', {
                    env = {
                        url = "http://127.0.0.1:11434",
                    },
                    schema = {
                        model = {
                            default = 'qwen2.5-coder:latest',
                            -- default = "llama3.1:8b-instruct-q8_0",
                        },
                        num_ctx = {
                            default = 32768,
                        },
                    },
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
            adapter = "ollama";
          };
          chat = {
            adapter = "ollama";
          };
          inline = {
            adapter = "ollama";
          };
        };
      };

    };
    coq-nvim.enable = true;
  };

}
