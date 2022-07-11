{ lib, fetchFromGitHub }:

let
  pname = "mplus-fonts";
in
fetchFromGitHub {
  name = "${pname}";

  owner = "coz-m";
  repo = "MPLUS_FONTS";
  rev = "8690be3625964d9992e7be4bc3e1a61a80161cc6";
  sha256 = "2uxVzQ2xKnkIU47I9epfM3DrKkuWQjns3U/kc4zN8sQ=";

  postFetch = ''
    tar xf $downloadedFile --strip=1
    install -m444 -Dt $out/share/fonts/opentype fonts/otf/*.otf
  '';

  meta = with lib; {
    description = "M+ Fonts";
    longDescription = "A little nifty font family for everyday use.";
    homepage = "https://github.com/coz-m/MPLUS_FONTS";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ robertodr ];
  };
}
