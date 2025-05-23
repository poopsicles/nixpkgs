{
  lib,
  stdenv,
  fetchurl,
  gettext,
  gnome,
  itstool,
  libxml2,
  yelp-tools,
}:

stdenv.mkDerivation rec {
  pname = "gnome-user-docs";
  version = "47.2";

  src = fetchurl {
    url = "mirror://gnome/sources/gnome-user-docs/${lib.versions.major version}/${pname}-${version}.tar.xz";
    hash = "sha256-2b8IuabChNHgT2/pI3pt7trRYeDlungQv/7PKF4rzd8=";
  };

  nativeBuildInputs = [
    gettext
    itstool
    libxml2
    yelp-tools
  ];

  enableParallelBuilding = true;

  passthru = {
    updateScript = gnome.updateScript {
      packageName = pname;
    };
  };

  meta = with lib; {
    description = "User and system administration help for the GNOME desktop";
    homepage = "https://help.gnome.org/users/gnome-help/";
    license = licenses.cc-by-30;
    teams = [ teams.gnome ];
    platforms = platforms.all;
  };
}
