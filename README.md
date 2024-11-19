# Final Project

## Pre-requisites

1. Kind (kubernetes in docker)
2. Kubernetes
3. Helm
4. Helmfile


## Reproduce Playbook

1. Create Kubernetes Cluster
    1. `sudo kind create cluster --name project-cluster --config ./cluster/config.yaml` 
    2. `sudo kubectl cluster-info --context kind-project-cluster`
    3. (Deletion command) `sudo kind delete cluster --name project-cluster`
2. Setup Helmfile
    1. `sudo helmfile apply -f helm/helmfile.yaml`

### Notes

1. Gitlab
    1. Get your `root` user password by running:
    `sudo kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -o jsonpath="{.data.password}" | base64 --decode > gitlab-secrets.txt`
    2. Visit `https://gitlab.localhost:8080`

2. Jenkins
    1. Get your `admin` user password by running:
        `sudo kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password > jenkins-secrets.txt`
    2. Visit `http://jenkins.localhost:8181`
    3. Login with the password from step 1 and the username: `admin`

3. Sonarqube
    1. Visit `http://sonarqube.localhost:8282`
    4. Login with `admin/admin`