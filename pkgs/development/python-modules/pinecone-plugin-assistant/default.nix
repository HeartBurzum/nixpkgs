{
  buildPythonPackage,
  lib,
  fetchPypi,
  poetry-core,
  requests,
}:

buildPythonPackage rec {
  pname = "pinecone-plugin-assistant";
  version = "1.6.1";

  pyproject = true;

  src = fetchPypi {
    pname = "pinecone_plugin_assistant";
    inherit version;
    hash = "sha256-0FgmMnvYtxVFGzsshM4zXEHLI/19n7n5Lz6ZZdW6sGs=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    requests
  ];

  meta = {
    homepage = "https://www.pinecone.io/";
    maintainers = with lib.maintainers; [ bot-wxt1221 ];
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    description = "Plugin interface for the Pinecone python client";
  };
}
