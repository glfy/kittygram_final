<h1 align="center" id="title">Kittygram</h1>

<p id="description">Welcome to an adorable social network that caters to billions of cat-aficionados worldwide - Kittygram! 


Kittygram is your go-to online destination dedicated to all things feline. This delightful platform allows users to create unique profiles for their beloved cats enabling a close-knit community of cat lovers to connect and interact. It's more than just profiles; it's a space where your cat's photos names special dates and accomplishments shine. Engage with the endless collection of cute cat profiles and initiate heartwarming discussions through comments. Join the Kittygram community today to bask in the delightful universe of cats!</p>

  
<h2>🧐 Features</h2>

Here're some of the project's best features:

*   😸 Showcase your adorable feline friends with the world!
*   😻 Follow fellow cat enthusiasts and engage in the community through comments!
*   😸 Let loose and have a paw-some time!

<h2>🛠️ Installation Steps:</h2>

<h3>Installation</h3>

<p>1. Clone the repository</p>

```
git clone https://github.com/glfy/kittygram_final.git
cd kittygram

```

<p>2. Create a .env file and fill it with your data:</p>

```
# Database secrets
POSTGRES_USER=[database_username]
POSTGRES_PASSWORD=[database_password]
POSTGRES_DB=[database_name]
DB_PORT=[database_connection_port]
DB_HOST=[db]

# Django secrets
SECRET_KEY='SECRET_KEY'
DEBUG=False
ALLOWED_HOSTS='your_domain'

```
<h3>Creating Docker Images:</h3>

<p>1. Replace username with your DockerHub username:</p>

```
cd frontend
docker build -t username/kittygram_frontend .
cd ../backend
docker build -t username/kittygram_backend .
cd ../nginx
docker build -t username/kittygram_gateway . 

```

<p>2. Upload images to DockerHub:</p>

```
docker push username/kittygram_frontend
docker push username/kittygram_backend
docker push username/kittygram_gateway
```

<h3>Deploy on a Remote Server:</h3>

<p>1. Connect to the remote server:</p>


```
ssh -i path_to_SSH_key_file/SSH_key_file_name username@server_ip 
```

<p>2. Create a kittygram directory on the server through the terminal:</p>

```
mkdir kittygram
```

<p>3. Install Docker Compose on the server:</p>

```
sudo apt update
sudo apt install curl
curl -fSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
sudo apt-get install docker-compose
```

<p>4. Copy the docker-compose.production.yml and .env files to the kittygram/ directory:</p>

```
scp -i path_to_SSH/SSH_name docker-compose.production.yml username@server_ip:/home/username/kittygram/docker-compose.production.yml
```

<p>5. Run Docker Compose in daemon mode:</p>

```
sudo docker-compose -f docker-compose.production.yml up -d
```

<p>6. Run migrations, collect backend static files, and copy them to /static/static/:</p>

```
sudo docker-compose -f docker-compose.production.yml exec backend python manage.py migrate
sudo docker-compose -f docker-compose.production.yml exec backend python manage.py collectstatic
sudo docker-compose -f docker-compose.production.yml exec backend cp -r /app/collected_static/. /static/static/
```

<p>7. On the server, open the Nginx config in the nano editor: </p>

```
sudo nano /etc/nginx/sites-enabled/default
```

<p>8. Change the location settings in the server section:</p>

```
location / {
    proxy_set_header Host $http_host;
    proxy_pass http://127.0.0.1:9000;
}
```

<p>9. Check the Nginx config's functionality:</p>

```
sudo nginx -t
```

<p>10. Reload Nginx:</p>

```
sudo service nginx reload
```
<h3>CI/CD Configuration</h3>

<p>1. The workflow file is already written and can be found in the directory:</p>

```
kittygram/.github/workflows/main.yml
```

<p>2. To adapt it for your server, add the following secrets in GitHub Actions:</p>

```
DOCKER_USERNAME                # DockerHub username
DOCKER_PASSWORD                # DockerHub password
HOST                           # Server's IP address
USER                           # Username
SSH_KEY                        # Private SSH key (cat ~/.ssh/id_rsa)
SSH_PASSPHRASE                 # SSH key passphrase

TELEGRAM_TO                    # Telegram account ID (can be obtained from @userinfobot, command /start)
TELEGRAM_TOKEN                 # Bot token (get token from @BotFather, /token, bot name)
```

Link to the deployed application https://studykotphilipp.ddnsking.com/signin

<h2>💻 Built with</h2>

Technologies used in the project:

*   Python - backend target language
*   Django Rest Framework - Python toolkit for building Web APIs
*   JavaScript - frontend target language
*   React - JavaScript library for building user interfaces
*   Gunicorn - Python WSGI HTTP Server for UNIX
*   Nginx - HTTP and reverse proxy server


## Authors

- backend – an unknown cat lover
- frontend – another unknown cat lover
- devops [Daria Gelfman](https://github.com/glfy)
- reviewer [Roman Reznikov](https://github.com/glfy)