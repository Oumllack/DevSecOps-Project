# Utiliser une image de base minimale et sécurisée
FROM nginx:alpine

# Créer un utilisateur non-root
RUN adduser -D -H -u 1000 nginxuser

# Copier les fichiers de configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/

# Définir les permissions
RUN chown -R nginxuser:nginxuser /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html && \
    chown -R nginxuser:nginxuser /var/cache/nginx && \
    chown -R nginxuser:nginxuser /var/log/nginx && \
    chown -R nginxuser:nginxuser /etc/nginx/conf.d

# Passer à l'utilisateur non-root
USER nginxuser

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"] 