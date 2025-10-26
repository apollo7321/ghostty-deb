# Ghostty Debian Package

**Unofficial Debian package for Ghostty**

This repository provides scripts to build ghostty and package it as Debian package.

Current version: **1.2.3**.

---

## Requirements

Tested on **Debian 13.1 (Trixie)**.

Install dependencies with:

```bash
sudo apt install build-essential devscripts debhelper minisign
```

You also need zig which is not available through the official repos. Use: https://codeberg.org/apollo7321/zig-deb

## Usage

Run:

```
./debian/build.sh
```

## License

 - Ghostty: 2024 Mitchell Hashimoto, Ghostty contributors
 - Packaging scripts: MIT License.
