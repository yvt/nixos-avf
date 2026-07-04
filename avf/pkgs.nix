{
  base,
  lib,
  ttyd,
  rustPlatform,
  protobuf,
  libwebsockets,
}:
{
  ttyd = ttyd.overrideAttrs (a: {
    patches = [
      "${base}/build/debian/ttyd/xtermjs_a11y.patch"
    ];
  });

  android_virt = lib.recurseIntoAttrs {
    # TODO: linux_vm_manager
  };
}
