# helm.tf

resource "helm_release" "gitlab" {
    name       = "gitlab"
    chart      = "gitlab"
    repository = "https://charts.gitlab.io"
    namespace  = kubernetes_namespace.gitlab.metadata[0].name

    timeout = 600

    set {
        name  = "certmanager-issuer.email"
        value = "sircodesworth@gmail.com"
    }

    set {
        name  = "global.hosts.externalIP"
        value = google_compute_address.external_ip.address
    }

    set {
        name  = "global.edition"
        value = "ce"  # Use "ce" for Community Edition, or "ee" for Enterprise Edition
    }

    # Configure GitLab services, storage, and persistence settings
    # set {
    #     name  = "gitlab-runner.install"
    #     value = "false"  # Install the runner separately if needed
    # }
}

# resource "helm_release" "jenkins" {
#     name       = "jenkins-agent"
#     chart      = "jenkins"
#     repository = "https://charts.jenkins.io"
#     namespace  = kubernetes_namespace.jenkins.metadata[0].name

#     set {
#         name  = "controller.admin.user"
#         value = "admin"
#     }

#     set {
#         name  = "controller.admin.password"
#         value = "03-MOMENT-case-fish-15"
#     }
# }

# resource "helm_release" "sonarqube" {
#     name       = "sonarqube-agent"
#     chart      = "sonarqube"
#     repository = "https://SonarSource.github.io/helm-chart-sonarqube"
#     namespace  = kubernetes_namespace.sonarqube.metadata[0].name

#     set {
#         name  = "service.type"
#         value = "LoadBalancer"
#     }

#     set {
#         name  = "postgresql.enabled"
#         value = "true"
#     }
# }
