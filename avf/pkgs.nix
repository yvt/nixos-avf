{
  base,
  lib,
  ttyd,
  rustPlatform,
  protobuf,
  libwebsockets,
}:
{
  ttyd =
    (ttyd.override {
      libwebsockets = libwebsockets.overrideAttrs (
        a:
        lib.optionalAttrs (lib.strings.versionOlder a.version "4.3.6") {
          patches = [
            "${base}/build/debian/ttyd/client_cert.patch"
          ];
        }
      );
    }).overrideAttrs
      (a: {
        patches = [
          "${base}/build/debian/ttyd/xtermjs_a11y.patch"
        ];
      });

  android_virt = lib.recurseIntoAttrs {
    # TODO: linux_vm_manager
  };
}
