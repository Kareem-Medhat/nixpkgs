{
  lib,
  bluetooth-data-tools,
  bluetooth-sensor-state-data,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pytestCheckHook,
  pythonOlder,
  sensor-state-data,
}:

buildPythonPackage rec {
  pname = "bluemaestro-ble";
  version = "0.2.3";
  format = "pyproject";

  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "Bluetooth-Devices";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-mJ5JNGN4F9U3WMJQDwiZwuxE0zOirwo1sWF3/bVwXhY=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    bluetooth-data-tools
    bluetooth-sensor-state-data
    sensor-state-data
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace " --cov=bluemaestro_ble --cov-report=term-missing:skip-covered" ""
  '';

  pythonImportsCheck = [ "bluemaestro_ble" ];

  meta = with lib; {
    description = "Library for bluemaestro BLE devices";
    homepage = "https://github.com/Bluetooth-Devices/bluemaestro-ble";
    changelog = "https://github.com/Bluetooth-Devices/bluemaestro-ble/blob/v${version}/CHANGELOG.md";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
