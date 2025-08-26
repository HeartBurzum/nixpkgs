{
  lib,
  buildPythonPackage,
  cryptography,
  cython,
  fetchPypi,
  pythonOlder,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "oracledb";
  version = "3.3.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "oracle";
    repo = "python-oracledb";
    tag = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-SHIEl4pzuQBJ02KRPmOydFtmVD9qF3LGk9WPiDSpVzQ=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "cython == 3.0.12" "cython"
  '';

  build-system = [
    cython
    setuptools
    wheel
  ];

  dependencies = [ cryptography ];

  # Checks need an Oracle database
  doCheck = false;

  pythonImportsCheck = [ "oracledb" ];

  meta = with lib; {
    description = "Python driver for Oracle Database";
    homepage = "https://oracle.github.io/python-oracledb";
    changelog = "https://github.com/oracle/python-oracledb/blob/v${version}/doc/src/release_notes.rst";
    license = with licenses; [
      asl20 # and or
      upl
    ];
    maintainers = with maintainers; [ harvidsen ];
  };
}
