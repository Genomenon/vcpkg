#header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SandSnip3r/thread-pool
    REF f012a783a1752ce562d8c83b48c5675e318c60d8
    SHA512 20dbd63997da1b614b32a56b11ec33cdea692245ed319cdd573806e9227f52ba32aeb736bfba635a23537fee041c637c642b5e74613a0cd3c5f62a2ba326e83b
    HEAD_REF master
)

# Install headers (header-only):
file(GLOB HEADER_FILES LIST_DIRECTORIES false "${SOURCE_PATH}/*.hpp")
file(INSTALL
    "${HEADER_FILES}"
    DESTINATION "${CURRENT_PACKAGES_DIR}/include"

)

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
