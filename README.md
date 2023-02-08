# How to easily deploy a LAMP stack using Docker
## The end result
After following this guide you will have :
- An Apache2 web server running on [`http://localhost:8080/`](http://localhost:8080/).
- A PHP interpreter.
- A MariaDB database.
- A PhpMyAdmin control panel running on [`http://localhost:8081/`](http://localhost:8081/).

The server will be serving files from the `./files` directory.

### Database accounts inside the container
> **Tip:** Edit the [`docker-compose.yml`](docker-compose.yml) file to change the defaults.

**Database user:** `mariadb`

**Database user password:** `password`

**Database root password:** `password`

**Database name:** `mariadb`

## Prerequisites
- A Git client
- Docker
- Docker Compose

On Debian and derivatives (Ubuntu, Pop_OS, Linux Mint, etc) you can use this command to install the required software :
```bash
sudo apt install docker.io docker-compose git
```

On Arch Linux and derivatives (Manjaro, EndeavourOS, etc) you can use this command to install the required software :
```bash
sudo pacman -S docker docker-compose git
```

## Setting up Docker
> You can skip this step if you already have a working Docker installation.

### 1) Starting the Docker service
```bash
sudo systemctl start docker.service
```

> **Tip:** You can also start Docker automatically when booting your computer by running this :
> ```bash
> sudo systemctl enable --now docker.service
> ```

### 2) Add your user to the `docker` group
> **Warning:** Granting an user access to the `docker` group is the same as giving root privileges ! 
> 
> Learn more : [Docker security](https://docs.docker.com/engine/security/#docker-daemon-attack-surface).

You can add the current user to the `docker` group by using this command :
```bash
sudo usermod -aG docker $(whoami)
```

You will need to re-open your session for this change to take effect.

## Clone this repository and start the containers
### 1) Cloning
Clone this repository using Git :
```bash
git clone 'https://github.com/ttcchhmm/docker-lamp.git'
cd docker-lamp
```

### 2) Build the containers
```bash
docker-compose build
```

> **Tip:** If you run into an issue at this step, try running this command to remove old builds of the `php:apache` image :
> ```bash
> docker image rm php:apache
> ```

### 3) Start the containers
You will need to run this command each time you want to start your LAMP stack :
```bash
docker-compose up -d
```

You can now edit the files inside the `./files` directory and the changes will be served by the web server.

### 4) Stop the containers
To stop the containers, run the following command :
```bash
docker-compose down
```

> **Warning:** Stopping the containers *WILL* delete your database ! You should make a backup using PhpMyAdmin if needed before stopping the containers.