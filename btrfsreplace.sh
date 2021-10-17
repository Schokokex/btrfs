#!/bin/sh

export sourcesubvol=Debian11Server
export bdev=/dev/sda2
export bootentry=@debian-current

apt install --no-install-recommends -y btrfs-progs || exit


export mtdir=$(mktemp -d)
mount $bdev -o subvol=/ $mtdir || exit

btrfs subvolume delete $mtdir/$bootentry-umleitung || rm -rf $mtdir/$bootentry-umleitung
btrfs subvolume snapshot $mtdir/$sourcesubvol $mtdir/$bootentry-umleitung
cd $mtdir && ln -snf $bootentry-umleitung $bootentry


btrfs subvolume delete $mtdir/$bootentry-trash || rm -rf $mtdir/$bootentry-trash
mv $mtdir/$bootentry-live $mtdir/$bootentry-trash
btrfs subvolume snapshot $mtdir/$sourcesubvol $mtdir/$bootentry-live
cd $mtdir && ln -snf $bootentry-live $bootentry

btrfs subvolume delete $mtdir/$bootentry-umleitung
