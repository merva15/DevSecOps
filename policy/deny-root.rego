package main

deny[msg] {
  input.kind == "Pod"
  not input.spec.securityContext.runAsNonRoot
  msg := "L'exécution en tant que root est interdite (runAsNonRoot non défini)"
}
