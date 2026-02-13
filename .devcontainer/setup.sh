if [ "${CODESPACES}" = "true" ]; then
  # Remove the default credential helper
  sudo sed -i -E 's/helper =.*//' /etc/gitconfig

  # Add one that just uses secrets available in the Codespace
  git config --global credential.helper '!f() { sleep 1; echo "username=${GITHUB_USER}"; echo "password=${GH_TOKEN}"; }; f'
fi

sudo chmod 666 /var/run/docker.sock || true

# Check if SSH files exist before copying
if [ -d "/tmp/.ssh-localhost" ] && [ "$(ls -A /tmp/.ssh-localhost 2>/dev/null)" ]; then
    echo "Copying SSH files from /tmp/.ssh-localhost/"
    sudo cp -R /tmp/.ssh-localhost/* ~/.ssh
else
    echo "No SSH files found in /tmp/.ssh-localhost, skipping SSH setup"
    # Ensure .ssh directory exists with proper permissions
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
fi

sudo chown -R $(whoami):$(whoami) /tf/caf ~/.ssh 2>/dev/null || true
sudo chmod 400 ~/.ssh/* 2>/dev/null || true


git config --global core.editor vim

pre-commit install
pre-commit autoupdate

git config --global --add safe.directory /tf/caf
git config --global --add safe.directory /tf/caf/landingzones
git config --global --add safe.directory /tf/caf/landingzones/aztfmod
git config --global --add safe.directory /tf/caf/aztfmod

git config pull.rebase false
git config --global credential.useHttpPath true
git config --global http.sslverify false

git config --global user.name "Cloud Enabler"              # modify to your name
git config --global user.email "mjacob@cloudenabler.onmicrosoft.com" # modify to your email address
