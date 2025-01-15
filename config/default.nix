{self, config, ...}: {
  config.allowUnfree = true;

  # Import all your configuration modules here
  imports = [ ./bufferline.nix ]; 
}
