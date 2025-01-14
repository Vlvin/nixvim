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
    codecompanion.enable = true;
    coq-nvim.enable = true;
  };
}
