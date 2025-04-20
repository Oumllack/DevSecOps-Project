# DevSecOps Project

This project demonstrates a secure web application deployment using modern DevSecOps practices. The application is containerized with Docker and deployed on Kubernetes with comprehensive security measures.

## Key Technologies Used

- **Kubernetes**: For container orchestration and deployment
- **Docker**: For containerization of the web application
- **Nginx**: As the web server
- **Security Features**:
  - Network Policies for traffic control
  - Pod Security Policies for runtime security
  - RBAC for access control
  - Secrets management
  - Monitoring setup

## Security Implementations

- Network isolation using NetworkPolicies
- Secure namespace configuration
- Secrets management with Kubernetes Secrets
- Role-Based Access Control (RBAC)
- Pod Security Policies
- Monitoring and logging setup

The application is accessible locally on port 8086 after port-forwarding the Kubernetes service.

## Prérequis

- Kubernetes 1.19+
- Helm 3.0+
- kubectl
- Docker

## Structure du Projet

```
.
├── web-app-deployment.yaml    # Déploiement Kubernetes
├── web-app-service.yaml       # Service Kubernetes
├── web-app-configmap.yaml     # Configurations non sensibles
├── web-app-secrets.yaml       # Secrets Kubernetes
├── web-app-network-policy.yaml # Politique réseau
├── web-app-psp.yaml          # Pod Security Policy
├── values.yaml               # Configuration Helm
├── security-tests.yaml       # Tests de sécurité
└── README.md                 # Documentation
```

## Déploiement

1. Créer le namespace :
```bash
kubectl create namespace secure-app
```

2. Appliquer les configurations :
```bash
kubectl apply -f web-app-network-policy.yaml
kubectl apply -f web-app-psp.yaml
kubectl apply -f web-app-secrets.yaml
kubectl apply -f web-app-configmap.yaml
kubectl apply -f web-app-deployment.yaml
kubectl apply -f web-app-service.yaml
kubectl apply -f security-tests.yaml
```

## Sécurité

Le projet implémente plusieurs mesures de sécurité :
- Network Policies
- Pod Security Policies
- Secrets management
- Conteneurs non-root
- Systèmes de fichiers en lecture seule
- Tests de sécurité automatisés

## Monitoring

Les tests de sécurité s'exécutent quotidiennement pour :
- Vérifier la conformité Kubernetes
- Scanner les vulnérabilités des images
- Vérifier les configurations de sécurité

## Maintenance

Pour mettre à jour l'application :
1. Modifier les fichiers de configuration
2. Appliquer les changements avec kubectl
3. Vérifier les logs des tests de sécurité 