#!/bin/bash

function deploy_cert_manager() {
  # Deploy Cert-Manager
  kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.15.0/cert-manager.yaml

  kubectl create secret generic acme-route53 --from-literal=secret-access-key="${cert_manager_r53_secret}" -n cert-manager

  # Cert Completer is a small Kubernetes operator that ensures that all TLS secrets have a valid ca.crt.
  # https://github.com/erwinvaneyk/cert-completer
  kubectl apply -f "${path_to_infra}/cert-manager/helper/cert-completer.yaml"

  # Update Issuer
  apply_yaml_file_changes "${path_to_infra}/cert-manager/${environment}/${cloud_provider}/issuer.yaml"
}