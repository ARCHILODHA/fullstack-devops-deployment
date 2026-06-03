
# Running Vault with Docker

Pull image:

```bash
docker pull hashicorp/vault
Run development server:

docker run --cap-add=IPC_LOCK -p 8200:8200 hashicorp/vault server -dev
