# PHP-FPM Docker Setup 🐘🐳

A minimal Docker-based PHP-FPM setup with runtime version switching and socket configuration. Ideal for local development and testing.

## ✨ Features

- 🔢 PHP version control via `__PHP_VERSION`
- 🔌 Unix socket at `/var/run/php/php<version>-fpm.sock`
- 🧩 Pre-installed extensions: PDO, mbstring, zip, gd
- 📦 Composer and 🐞 Xdebug included
- ⚙️ Configuration managed via templated files

## 🚀 Quick Start

```bash
__PHP_VERSION=8.3 make init
__PHP_VERSION=8.3 make
```

## 🛠️ Makefile Commands

- `make init` — 📁 Copies default configuration files to editable versions
- `make` — 🛠️ Builds and starts the container
- `make build` — 🏗️ Builds the image only
- `make up` — 🚀 Starts the container
- `make down` — ⛔ Stops and removes containers and orphans
- `make rebuild` — ♻️ Rebuilds everything from scratch
- `make bash` — 🐚 Opens a shell in the container
- `make logs` — 📜 Tails container logs

## 🗂️ Project Structure

```
📦 .
├── Dockerfile
├── Makefile
├── .env.example
├── docker-compose.yml
├── conf/
│   ├── php.default.ini
│   ├── www.conf.default.template
│   └── zz-docker.conf.default.template
```

## 📝 Notes

- 📁 A Docker volume named `fpms` is used to store PHP FPM sockets
- 🔄 You can change PHP versions dynamically using `__PHP_VERSION` without modifying any files

