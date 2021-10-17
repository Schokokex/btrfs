# btrfs

advantages of btrfs: immediate snapshots and rollbacks

# idea
Combining the power of Nix Package Manager and Btrfs, we can create an operating system where Operating System Files, App Binary Files and App User Data are seperated strictly. The Operating System Files should get resetted each reboot to provide a temporary mutable system. I am using debian here.

# benefits


# Principles
Mutable subvolumes start with @
If there is 2 ways to solve something, we choose the lighter way. (prefering no-install-recommends and efistub)


# Steps:
1. Install Operating System (server with drivers, then gui, then add users)
2. Setting up Nix
3. Setting up the resetting mechanism
4.

1.
We install our Operating System on a btrfs subvolume. We should make multiple snapshots during the installation, in case you do something wrong or want to have a lighter setup again.

2.
I created a btrfs subvolume @nix and mounted it into /nix. The offical installing script seems to break on an existing /nix folder, so we see if installing nix from the apt repo works as good. Gives me an error

3.
There is some benefits coming here now. Active snapshots can be renamed easily
