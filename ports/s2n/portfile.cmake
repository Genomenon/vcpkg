vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO aws/s2n-tls
    REF 7d02417a575b62c50ba08d791d11495238164815 # v1.3.1
    SHA512 27770b5281bc9c4d4988ad7bdd8217722b24ef98878ac8262ad6130c42cdd5b81a0ad820916fb3c009fcf9809fa1c2548d602c03ddbfba4462380fd2faa9e470
    PATCHES fix-cmake-target-path.patch
            remove-libcrypto-messages.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DUNSAFE_TREAT_WARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/s2n/cmake)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/lib/s2n"
	"${CURRENT_PACKAGES_DIR}/lib/s2n"
	)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE	"${CURRENT_PACKAGES_DIR}/debug/share")

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
