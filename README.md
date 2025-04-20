# Application Web Sécurisée

Ce projet est une application web déployée sur Kubernetes avec des mesures de sécurité avancées.

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