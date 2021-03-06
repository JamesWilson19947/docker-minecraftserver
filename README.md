# docker-minecraftserver
Dockerised Minecraft server using Paper

## Project Stages
1. Deployable Docker container that auto runs the latest version of Paper
2. Testing with Travis CI
3. Automated container deployment somewhere...

## Project notes

### GCP Docker and Kubernetes app deployment
https://cloud.google.com/kubernetes-engine/docs/tutorials/hello-app

1. `git clone https://github.com/danwiltshire/docker-minecraftserver.git`
2. `export PROJECT_ID=eminent-century-263110`
3. `gcloud config set project $PROJECT_ID`
4. `docker build -t gcr.io/${PROJECT_ID}/minecraftserver:latest .`
5. `docker push gcr.io/${PROJECT_ID}/minecraftserver:latest`
6. `gcloud config set compute/zone europe-west2-b`
7. `gcloud container clusters create minecraftserver-cluster --num-nodes=2`
8. `kubectl apply -f ssd-storageclass.yaml`
9. `kubectl apply -f ssd-claim.yaml`
10. `kubectl apply -f paper-deployment.yaml`
11. `kubectl apply -f paper-service.yaml`

#### Verification
- `kubectl get service`
- `kubectl get deployment minecraftserver-dpmt`
- `kubectl get pods`

#### Misc commands
- Specify what cluster to run kubectl against: `gcloud container clusters get-credentials my-cluster`
- Running individual kubectl commands against a specific cluster using `--cluster my-cluster`
- RCON `mcrcon -H x.x.x.x -P 25575 -p xxxxxxxxxxx -t`
