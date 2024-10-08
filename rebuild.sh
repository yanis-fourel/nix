# Based on NoBoilerplates' dotfiles. I love his youtube channel

set -e
pushd ~/nixos/
git add .
sudo nix flake lock --update-input mynvim
echo "NixOS Rebuilding..."
sudo nixos-rebuild --flake . switch # || (cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git add .
git commit -m "$gen"
popd
