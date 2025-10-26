#!/bin/sh

set -e

name="ghostty"
version="1.2.3"
ext="tar.gz"
url="https://release.files.ghostty.org/$version/$name-$version.$ext"
pub_key="RWQlAjJC23149WL2sEpT/l0QKy7hMIFhYdQOFy0Z7z7PbneUgvlsnYcV"
script_path="$(cd "$(dirname "$0")/.." && pwd)"
orig_name="${name}_$version.orig.$ext"

# clean
git clean -fdx
git restore .

# download binary package
cd "$script_path/.."
if [ ! -e "$orig_name" ]; then
    curl -fL "$url" -o "$orig_name"
fi

curl -fL "$url.minisig" -o "$orig_name.minisig"
minisign -V -P "$pub_key" -m "$orig_name"
rm -f "$orig_name.minisig"

tar xf "$orig_name" -C "$script_path" --strip-components=1
cd "$script_path"

# build
debuild -us -uc
