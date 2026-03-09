export GHCR_OWNER="meipenlei"   # must be lowercase for GHCR
export GHCR_TOKEN="ghp_......" # set this to your GHCR token, which can be generated in GitHub under Settings > Developer settings > Personal access tokens > Tokens (classic) > Generate new token. The token needs at least "read:packages" scope to pull the image.

echo "$GHCR_TOKEN" | docker login ghcr.io -u "$GHCR_OWNER" --password-stdin

make ghcr arch=linux/amd64 agent=0

docker run --rm -it ghcr.io/meipenlei/rover-ghcr:1.14.6-2603.0615 bash -lc \
  'id && sudo -n true && echo OK && ls -la /etc/sudoers.d && cat /etc/sudoers.d/vscode'