# plugin configuration
{
  plugins = {
    bufferline.enable = true;
    web-devicons.enable = true;
    lightline.enable = true;
    chadtree.enable = true;
    floaterm.enable = true;
    coq-nvim.enable = true;
  };
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

}
